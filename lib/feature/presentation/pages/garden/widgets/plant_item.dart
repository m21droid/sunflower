import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/pages/garden/alerts/alert_dialog_widget.dart';
import 'package:sunflower/feature/presentation/pages/plant/plant_page.dart';
import 'package:sunflower/feature/presentation/widgets/progress_widget.dart';

class PlantItem extends StatelessWidget {
  static const stylePrimary =
      TextStyle(color: AppColors.primaryText, fontSize: 16);
  static const styleSecondary = TextStyle(
      color: AppColors.secondaryText,
      fontSize: 16,
      fontWeight: FontWeight.bold);

  final PlantEntity _plant;
  final bool isExtended;

  const PlantItem(this._plant, {super.key, this.isExtended = false});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(12);
    const size = 48.0;
    final image = SvgPicture.asset('assets/images/ic_plant.svg',
        width: size, height: size, colorFilter: AppColors.secondaryColorFilter);
    const boxDecoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: radius));

    final item = Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(topRight: radius),
          child: CachedNetworkImage(
            imageUrl: _plant.imageUrl,
            width: double.infinity,
            height: 128,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, progress) =>
                const _PlantTopItem(child: AppProgress()),
            errorWidget: (context, url, error) => _PlantTopItem(child: image),
          ),
        ),
        isExtended
            ? _PlantBottomExtItem(_plant, boxDecoration: boxDecoration)
            : _PlantBottomItem(_plant, boxDecoration: boxDecoration)
      ],
    );

    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, PlantPage.routeName, arguments: _plant);
        },
        onLongPress: isExtended
            ? () {
                showDialog(
                    context: context,
                    builder: (context) => DeleteAlertDialog(_plant));
              }
            : null,
        child: item);
  }
}

class _PlantTopItem extends StatelessWidget {
  final Widget child;

  const _PlantTopItem({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.dark, alignment: Alignment.center, child: child);
  }
}

class _PlantBottomItem extends StatelessWidget {
  final PlantEntity _plant;
  final BoxDecoration boxDecoration;

  const _PlantBottomItem(this._plant, {required this.boxDecoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: boxDecoration,
      alignment: Alignment.center,
      child: Text(_plant.name, style: PlantItem.stylePrimary),
    );
  }
}

class _PlantBottomExtItem extends StatelessWidget {
  final PlantEntity _plant;
  final BoxDecoration boxDecoration;

  const _PlantBottomExtItem(this._plant, {required this.boxDecoration});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 8);
    String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    return Container(
      height: 160,
      decoration: boxDecoration,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_plant.name, style: PlantItem.stylePrimary),
          space,
          const Text('Planted', style: PlantItem.styleSecondary),
          Text(date, style: PlantItem.stylePrimary),
          space,
          const Text('Last Watered', style: PlantItem.styleSecondary),
          Text(date, style: PlantItem.stylePrimary),
          Text('water in ${_plant.wateringInterval} days.',
              style: PlantItem.stylePrimary),
        ],
      ),
    );
  }
}
