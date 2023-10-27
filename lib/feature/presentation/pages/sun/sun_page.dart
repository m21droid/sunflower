import 'package:flutter/material.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/feature/presentation/pages/sun/widget/night_animated_widget.dart';
import 'package:sunflower/feature/presentation/pages/sun/widget/sun_animated_widget.dart';
import 'package:sunflower/feature/presentation/pages/sun/widget/sun_info_widget.dart';
import 'package:sunflower/feature/presentation/widgets/floating_action_button_widget.dart';

class SunPage extends StatefulWidget {
  static const routeName = '/sun';

  const SunPage({super.key});

  @override
  State<SunPage> createState() => _SunPageState();
}

class _SunPageState extends State<SunPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<dynamic> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 24), vsync: this)
          ..addStatusListener((status) {
            debugPrint('SunPage.listener: status - $status');
          });
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              const SunInfo(),
              SunAnimatedWidget(listenable: _animation),
            ],
          ),
          NightAnimatedWidget(listenable: _animation),
        ],
      ),
      floatingActionButton: AppFloatingActionButton(
          _controller.isAnimating ? Icons.stop : Icons.play_arrow,
          onPressed: _pauseAnim),
      backgroundColor: AppColors.background,
    );
  }

  _pauseAnim() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      _controller.repeat();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
