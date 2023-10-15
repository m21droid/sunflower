import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunflower/core/res/colors.dart';

class PlantHeader extends SliverPersistentHeaderDelegate {
  final String url;

  PlantHeader(this.url);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final placeholder = Container(
        color: AppColors.dark,
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/images/ic_plant.svg',
            width: 96, height: 96, color: AppColors.secondary));
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) => placeholder,
    );
  }

  @override
  double get maxExtent => 240;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
