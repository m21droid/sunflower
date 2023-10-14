import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/widgets/progress_widget.dart';

class PlantItem extends StatelessWidget {
  final PlantEntity plant;

  const PlantItem({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(12);
    final image = SvgPicture.asset('assets/images/ic_plant.svg',
        width: 48, height: 48, color: AppColors.secondary);
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(topRight: radius),
          child: CachedNetworkImage(
            imageUrl: plant.imageUrl,
            width: double.infinity,
            height: 128,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, progress) =>
                const _PlantTopItem(child: AppProgress()),
            errorWidget: (context, url, error) => _PlantTopItem(child: image),
          ),
        ),
        Container(
          height: 48,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: radius)),
          alignment: Alignment.center,
          child: Text(plant.name),
        )
      ],
    );
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
