import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/feature/presentation/pages/garden/garden_page.dart';
import 'package:sunflower/feature/presentation/pages/splash/widgets/splash_animated_builder.dart';
import 'package:sunflower/feature/presentation/pages/splash/widgets/splash_animated_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  final type = true;

  late final AnimationController _controller;
  late final Animation<dynamic> _animation;

  @override
  void initState() {
    super.initState();

    // SplashAnimatedBuilder
    _controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.pushNamed(context, GardenPage.routeName);
            }
          });

    // SplashAnimatedWidget
    final Animation<double> curve = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.75, curve: Curves.elasticInOut));
    _animation = Tween(begin: 0.0, end: 10.0).animate(curve);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    const size = 96.0;
    final image = SvgPicture.asset('assets/images/ic_splash.svg',
        width: size, height: size, colorFilter: AppColors.darkColorFilter);
    const text = Text("SUNFLOWER",
        style: TextStyle(
            color: AppColors.secondaryText, fontWeight: FontWeight.bold));

    return Scaffold(
      body: type
          ? SplashAnimatedBuilder(
              controller: _controller, image: image, text: text)
          : SplashAnimatedWidget(
              listenable: _animation, image: image, text: text),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.reset();
            _controller.forward();
          },
          child: const Icon(Icons.play_arrow, color: AppColors.dark)),
      backgroundColor: AppColors.background,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
