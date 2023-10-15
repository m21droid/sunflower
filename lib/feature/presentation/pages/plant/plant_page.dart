import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/pages/plant/widgets/plant_header.dart';
import 'package:sunflower/feature/presentation/widgets/button_circle.dart';

class PlantPage extends StatelessWidget {
  static const routeName = '/plant';

  final PlantEntity plant;

  const PlantPage(this.plant, {super.key});

  @override
  Widget build(BuildContext context) {
    onTapBack() {
      Navigator.pop(context);
    }

    onTapShare() {
      /*final box = context.findRenderObject() as RenderBox?;
      final sharePositionOrigin = box!.localToGlobal(Offset.zero) & box.size;
      Share.share(plant.name,
          subject: 'Plant', sharePositionOrigin: sharePositionOrigin);*/
    }

    const padding = EdgeInsets.all(16);
    const space = SizedBox(height: 24);
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverPersistentHeader(delegate: PlantHeader(plant.imageUrl)),
              ];
            },
            body: Padding(
              padding: padding,
              child: Column(
                children: [
                  Text(plant.name,
                      style: const TextStyle(
                          color: AppColors.primaryText, fontSize: 24)),
                  space,
                  const Text('Watering needs',
                      style: TextStyle(
                          color: AppColors.secondaryText, fontSize: 18)),
                  Text('every ${plant.wateringInterval} days',
                      style: const TextStyle(
                          color: AppColors.tertiaryText, fontSize: 18)),
                  space,
                  _DescriptionText(plant.description),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleButton(Icons.arrow_back, onTap: onTapBack),
                  CircleButton(Icons.share, onTap: onTapShare)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  final String _text;

  const _DescriptionText(this._text);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: AppColors.primaryText, fontSize: 16);

    var description = _text.replaceAll('<br>', '\n');
    final href = RegExp('<a href.*a>').firstMatch(description)?.group(0);

    if (href != null) {
      debugPrint('DescriptionText.build: href - $href');
      final link =
          RegExp('".*"').firstMatch(href)?.group(0)?.replaceAll('"', '');
      debugPrint('DescriptionText.build: link - $link');
      final text = RegExp('>.*<')
          .firstMatch(href)
          ?.group(0)
          ?.replaceAll('>', '')
          .replaceAll('<', '');
      debugPrint('DescriptionText.build: text - $text');

      if (link != null && link.isNotEmpty && text != null && text.isNotEmpty) {
        final index = description.indexOf(href);
        debugPrint('DescriptionText.build: index - $index');

        return RichText(
          text: TextSpan(
            style: style,
            children: [
              TextSpan(text: description.substring(0, index), style: style),
              TextSpan(
                  text: text,
                  style: const TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 16,
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
/*
                      final uri = Uri.parse(link);
                      if (await canLaunchUrl(uri)) {
                        launchUrl(uri);
                      } else {
                        const toast = AppToast('Browser not found');
                        const snackBar = SnackBar(
                            content: toast, backgroundColor: Colors.white);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
*/
                    }),
              TextSpan(
                  text: description.substring(index + href.length),
                  style: style),
            ],
          ),
        );
      }
    }
    return Text(description, style: style);
  }
}
