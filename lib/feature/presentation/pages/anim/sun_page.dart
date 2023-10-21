import 'package:flutter/material.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/feature/presentation/pages/anim/widget/night_animated_widget.dart';
import 'package:sunflower/feature/presentation/pages/anim/widget/sun_animated_widget.dart';

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
            debugPrint('_SunPageState.listener: status - $status');
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
              const Text('TEST'),
              SunAnimatedWidget(listenable: _animation),
            ],
          ),
          NightAnimatedWidget(listenable: _animation),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.repeat();
          }
          setState(() {});
        },
        child: Icon(_controller.isAnimating ? Icons.stop : Icons.play_arrow,
            color: AppColors.dark),
      ),
      backgroundColor: AppColors.background,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
