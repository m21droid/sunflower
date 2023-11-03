import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/core/temp.dart';
import 'package:sunflower/feature/presentation/pages/sun/bloc/sun_bloc.dart';
import 'package:sunflower/feature/presentation/pages/sun/bloc/sun_state.dart';
import 'package:sunflower/feature/presentation/widgets/progress_widget.dart';

class SunInfo extends StatelessWidget {
  const SunInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 22);
    final styleSunrise = style.copyWith(color: AppColors.secondary);
    final styleSunset = style.copyWith(color: AppColors.tertiaryText);
    return BlocBuilder<SunBloc, SunState>(builder: (context, state) {
      if (state is SunLoadingState) {
        return const AppProgress();
      }
      var sunrise = "-";
      var sunset = "-";
      if (state is SunLoadedState) {
        sunrise = _formatDateTime(state.sun.sunTimes.sunrise);
        sunset = _formatDateTime(state.sun.sunTimes.sunset);
      }
      return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            Text('Sunrise',
                style: styleSunrise.copyWith(fontWeight: FontWeight.bold)),
            Text(sunrise, style: styleSunrise),
          ],
        ),
        Column(
          children: [
            Text('Sunset',
                style: styleSunset.copyWith(fontWeight: FontWeight.bold)),
            Text(sunset, style: styleSunset),
          ],
        ),
      ]);
    });
  }

  String _formatDateTime(DateTime dateTime) {
    if (dateTime.year <= year) {
      return '-- : -- : --';
    }
    final timeZoneOffset = DateTime.now().timeZoneOffset;
    final dateTimeOffset = dateTime.add(timeZoneOffset);
    return DateFormat('HH : mm : ss').format(dateTimeOffset);
  }
}
