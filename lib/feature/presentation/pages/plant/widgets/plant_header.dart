import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunflower/core/res/colors.dart';

class PlantHeader extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final double sizePlaceholder;
  final String url;

  PlantHeader(
      {this.minHeight = 0,
      this.maxHeight = 240,
      this.sizePlaceholder = 96,
      this.url = ""})
      : assert(maxHeight > sizePlaceholder);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final placeholder = Container(
      color: AppColors.dark,
      alignment: Alignment.center,
      child: SvgPicture.asset('assets/images/ic_plant.svg',
          width: sizePlaceholder,
          height: sizePlaceholder,
          colorFilter: AppColors.secondaryColorFilter),
    );
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) => placeholder,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
