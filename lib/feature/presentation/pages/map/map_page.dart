import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sunflower/core/ext/latlng_ext.dart';
import 'package:sunflower/feature/presentation/widgets/animated_switcher_widget.dart';
import 'package:sunflower/feature/presentation/widgets/floating_action_button.dart';

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
  var _isVisibleDate = false;
  var _isVisibleLocation = false;

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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppAnimatedSwitcher(
            isVisible: _isVisibleDate,
            child: AppFloatingActionButton(Icons.calendar_month,
                onPressed: _onTapDate),
          ),
          AppAnimatedSwitcher(
            isVisible: _isVisibleLocation,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: AppFloatingActionButton(Icons.my_location,
                  onPressed: _goToMyLocation),
            ),
          ),
        ],
      ),
    );
  }

  _onTapDate() async {}

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
          onTap: _onTapInfoWindow(latLng)),
    );
    _markers.add(marker);
    setState(() {});
  }

  _onTapInfoWindow(LatLng latLng) {
    //locator<GetSunTimes>().call(latLng);
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

        setState(() {
          _isVisibleDate = true;
          _isVisibleLocation = true;
        });
        break;
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
      case LocationPermission.unableToDetermine:
        setState(() {
          _isVisibleDate = true;
          _isVisibleLocation = false;
        });
    }
  }

  _goToMyLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_myPosition));
  }
}
