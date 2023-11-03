import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunflower/core/ext/pair.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/core/temp.dart';
import 'package:sunflower/feature/presentation/pages/garden/widgets/all_plants_tab.dart';
import 'package:sunflower/feature/presentation/pages/garden/widgets/my_plants_tab.dart';
import 'package:sunflower/feature/presentation/pages/map/map_page.dart';
import 'package:sunflower/feature/presentation/pages/sun/sun_page.dart';
import 'package:sunflower/feature/presentation/widgets/floating_action_button_widget.dart';
import 'package:sunflower/feature/presentation/widgets/toast_widget.dart';

class GardenPage extends StatefulWidget {
  static const routeName = '/garden';

  const GardenPage({Key? key}) : super(key: key);

  @override
  State<GardenPage> createState() => _GardenPageState();
}

class _GardenPageState extends State<GardenPage>
    with SingleTickerProviderStateMixin {
  static const double _size = 32.0;

  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 2, initialIndex: 0, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunflower',
            style: TextStyle(fontSize: 24, color: Colors.white)),
        centerTitle: true,
        shadowColor: AppColors.dark,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.secondary),
            tooltip: 'Search for a plant',
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          unselectedLabelColor: AppColors.dark,
          labelColor: AppColors.secondary,
          tabs: [
            _tab(0, 'My garden', 'ic_sunflower'),
            _tab(1, 'Plant list', 'ic_plant'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          MyPlantsTab(onRequestData: () {
            _controller.index = 1;
          }),
          const AllPlantsTab(),
        ],
      ),
      floatingActionButton: AppFloatingActionButton(
        Icons.sunny,
        onPressed: _onPressedSun,
      ),
      backgroundColor: AppColors.background,
    );
  }

  Tab _tab(int index, String text, String assetName) => Tab(
        text: text,
        icon: SvgPicture.asset(
          'assets/images/$assetName.svg',
          width: _size,
          height: _size,
          colorFilter: _controller.index == index
              ? AppColors.secondaryColorFilter
              : AppColors.darkColorFilter,
        ),
      );

  _onPressedSun() {
    if (Platform.isAndroid) {
      const channel = MethodChannel('geo_api_key');
      channel.invokeMethod<String>('requestGeoApiKey').then(
        (value) {
          if (value != null && value.isNotEmpty) {
            Navigator.pushNamed(context, MapPage.routeName);
          } else {
            _startSunPage();
          }
        },
        onError: (error) {
          _startSunPage();
        },
      );
    } else {
      _startSunPage();
    }
  }

  _startSunPage() {
    Navigator.pushNamed(context, SunPage.routeName,
        arguments: Pair(latLng, DateTime.now()));
    context.showToast(
        'To display the map you need to add your API_KEY for GoogleMaps.');
  }
}
