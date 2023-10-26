import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/core/locator.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/core/temp.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/domain/usecases/save_my_plant.dart';
import 'package:sunflower/feature/presentation/pages/garden/bloc/my_plants_bloc.dart';
import 'package:sunflower/feature/presentation/pages/garden/bloc/plants_state.dart';
import 'package:sunflower/feature/presentation/widgets/animated_switcher_widget.dart';
import 'package:sunflower/feature/presentation/widgets/toast_widget.dart';

class PlantAddButton extends StatefulWidget {
  final PlantEntity plant;
  final double size;

  const PlantAddButton({super.key, required this.plant, required this.size});

  @override
  State<PlantAddButton> createState() => _PlantAddButtonState();
}

class _PlantAddButtonState extends State<PlantAddButton> {
  var _isVisible = false;

  @override
  void initState() {
    super.initState();

    final state = context.read<MyPlantsBloc>().state;
    if (state is PlantsLoadedState) {
      final b = !state.plants.contains(widget.plant);
      if (b) {
        _isVisible = true;
      }
    } else {
      if (state is PlantsEmptyState) {
        _isVisible = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppAnimatedSwitcher(
      isVisible: _isVisible,
      child: InkWell(
        onTap: _onTapAdd,
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: const BoxDecoration(
              color: AppColors.secondary, borderRadius: borderRadius),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  _onTapAdd() {
    final plant = widget.plant;
    locator<SaveMyPlant>().call(plant).then((value) {
      context.read<MyPlantsBloc>().addPlant(plant);
      context.showToast('Plant ${plant.name} was added successfully');
      setState(() {
        _isVisible = false;
      });
    }, onError: (e) {
      context.showToast('Error adding plant ${plant.name}');
    });
  }
}
