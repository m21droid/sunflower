import 'dart:math';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/pages/plant/widgets/plant_add_button_widget.dart';
import 'package:sunflower/feature/presentation/pages/plant/widgets/plant_description_widget.dart';
import 'package:sunflower/feature/presentation/pages/plant/widgets/plant_header.dart';
import 'package:sunflower/feature/presentation/widgets/circle_button_widget.dart';

class PlantPage extends StatefulWidget {
  static const routeName = '/plant';

  final PlantEntity _plant;

  const PlantPage(this._plant, {super.key});

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  static const _heightHeader = 240.0;
  static const _sizeAdd = 64.0;
  static const _marginAdd = _heightHeader - _sizeAdd / 2;
  static const _offsetAdd = _marginAdd / 2;

  late ScrollController _controller;
  var _offsetScroll = _marginAdd;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController()
      ..addListener(() {
        setState(() {
          _offsetScroll = _marginAdd - _controller.offset;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final plant = widget._plant;

    onTapBack() {
      Navigator.pop(context);
    }

    onTapShare() {
      final box = context.findRenderObject() as RenderBox?;
      final sharePositionOrigin = box!.localToGlobal(Offset.zero) & box.size;
      Share.share(plant.name,
          subject: 'Plant', sharePositionOrigin: sharePositionOrigin);
    }

    const padding = EdgeInsets.all(16);
    const space = SizedBox(height: 24);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          NestedScrollView(
            controller: _controller,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverPersistentHeader(
                delegate:
                    PlantHeader(maxHeight: _heightHeader, url: plant.imageUrl),
              ),
            ],
            body: ListView(
              padding: padding,
              children: [
                Text(plant.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColors.primaryText, fontSize: 24)),
                space,
                const Text('Watering needs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.secondaryText, fontSize: 18)),
                Text('every ${plant.wateringInterval} days',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColors.tertiaryText, fontSize: 18)),
                space,
                PlantDescription(plant.description),
                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            ),
          ),
          Container(
            width: _sizeAdd,
            height: _sizeAdd,
            margin: EdgeInsets.only(top: max(0, _offsetScroll), right: 16),
            child: Opacity(
              opacity: max(0, min(_offsetScroll, _offsetAdd)) / _offsetAdd,
              child: PlantAddButton(plant: plant, size: _sizeAdd),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppCircleButton(Icons.arrow_back, onTap: onTapBack),
                  AppCircleButton(Icons.share, onTap: onTapShare)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
