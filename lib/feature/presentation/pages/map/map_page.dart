import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunflower/core/ext/latlng_ext.dart';
import 'package:sunflower/core/ext/pair.dart';
import 'package:sunflower/feature/presentation/pages/map/widgets/animated_floating_action_button_widget.dart';
import 'package:sunflower/feature/presentation/pages/sun/sun_page.dart';
import 'package:sunflower/feature/presentation/widgets/toast_widget.dart';

class MapPage extends StatefulWidget {
  static const routeName = '/map';

  const MapPage({super.key});

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final _controller = Completer<GoogleMapController>();
  final _markers = <Marker>{};

  var _myPosition = const CameraPosition(target: LatLng(0, 0), zoom: 0);
  var _date = DateTime.now();

  @override
  void initState() {
    super.initState();

    _getMyLocation();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration()).then((value) => _onUpdateGoogleMap());
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _myPosition,
        compassEnabled: false,
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        markers: _markers,
        onMapCreated: _onCreatedGoogleMap,
        onTap: _onTapGoogleMap,
      ),
      floatingActionButton: AppAnimatedFloatingActionButton(
        date: _date,
        onPressedDate: () => _onPressedDate(context),
        onPressedLocation: _onPressedLocation,
      ),
    );
  }

  _onCreatedGoogleMap(controller) {
    _controller.complete(controller);

    // Set map style
    /*rootBundle.loadString('assets/map_style.json').then((mapStyle) async {
      final controller = await _controller.future;
      controller.setMapStyle(mapStyle);
    });*/
  }

  _onUpdateGoogleMap() async {
    final controller = await _controller.future;
    for (var element in _markers) {
      controller.showMarkerInfoWindow(element.markerId);
      final zoom = await controller.getZoomLevel();
      final position = CameraPosition(target: element.position, zoom: zoom);
      controller.animateCamera(CameraUpdate.newCameraPosition(position));
    }
  }

  _onTapGoogleMap(LatLng latLng) async {
    debugPrint('MapPage.onTapMap: latLng - $latLng');

    _markers.clear();
    final marker = Marker(
      markerId: MarkerId(latLng.info()),
      position: latLng,
      infoWindow: InfoWindow(
          title: 'Observation point',
          snippet: latLng.info(),
          onTap: () => _onTapInfoWindow(latLng)),
    );
    _markers.add(marker);
    setState(() {});
  }

  _onTapInfoWindow(LatLng latLng) {
    debugPrint('MapPage.onTapInfoWindow: latLng - $latLng');

    Navigator.pushNamed(context, SunPage.routeName,
        arguments: Pair(latLng, _date));
  }

  _getMyLocation() async {
    final permission = await Geolocator.requestPermission();
    debugPrint('MapPage.getLocation: permission - $permission');

    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        LatLng location = LatLng(position.latitude, position.longitude);
        _myPosition = CameraPosition(target: location, zoom: 10.0);
        _goToMyLocation();
        break;
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
      case LocationPermission.unableToDetermine:
    }
  }

  _goToMyLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_myPosition));
  }

  _onPressedDate(BuildContext context) async {
    final year = DateTime.now().year;
    final date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(year - 10),
      lastDate: DateTime(year + 10),
    );
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
    }
  }

  _onPressedLocation() {
    Geolocator.checkPermission().then((value) {
      debugPrint('MapPage.onPressedLocation: permission - $value');

      switch (value) {
        case LocationPermission.always:
        case LocationPermission.whileInUse:
          _goToMyLocation();
          break;
        case LocationPermission.denied:
        case LocationPermission.deniedForever:
        case LocationPermission.unableToDetermine:
          context.showToast('Device geolocation is disabled for all apps.');
      }
    });
  }
}
