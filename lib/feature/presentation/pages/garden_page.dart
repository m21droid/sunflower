import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/feature/presentation/widgets/plant_list.dart';

class GardenPage extends StatefulWidget {
  const GardenPage({Key? key}) : super(key: key);

  @override
  State<GardenPage> createState() => _GardenPageState();
}

class _GardenPageState extends State<GardenPage>
    with SingleTickerProviderStateMixin {
  final _size = 32.0;

  final _color = Colors.white;
  final _selectedColor = AppColors.secondary;
  final _unselectedColor = AppColors.dark;

  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 2, initialIndex: 0, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title:
              Text('Sunflower', style: TextStyle(fontSize: 24, color: _color)),
          centerTitle: true,
          shadowColor: _unselectedColor,
          bottom: TabBar(
            controller: _controller,
            indicatorColor: _color,
            unselectedLabelColor: _unselectedColor,
            labelColor: _selectedColor,
            tabs: [
              Tab(
                text: 'My garden',
                icon: SvgPicture.asset('assets/images/ic_sunflower.svg',
                    width: _size,
                    height: _size,
                    color: _controller.index == 0
                        ? _selectedColor
                        : _unselectedColor),
              ),
              Tab(
                text: 'Plant list',
                icon: SvgPicture.asset('assets/images/ic_plant.svg',
                    width: _size,
                    height: _size,
                    color: _controller.index == 1
                        ? _selectedColor
                        : _unselectedColor),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: const [FlutterLogo(), PlantList()],
        ),
        backgroundColor: AppColors.background,
      );
}
