import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/feature/presentation/widgets/toast_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PlantDescription extends StatelessWidget {
  final String _text;

  const PlantDescription(this._text, {super.key});

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
                    ..onTap = () {
                      final uri = Uri.parse(link);
                      canLaunchUrl(uri).then(
                        (value) => launchUrl(uri),
                        onError: (e) => context.showToast('Browser not found'),
                      );
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
