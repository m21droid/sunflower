import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/core/locator.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/domain/usecases/delete_my_plant.dart';
import 'package:sunflower/feature/presentation/bloc/my_plants_bloc.dart';
import 'package:sunflower/feature/presentation/widgets/toast_widget.dart';

class DeleteAlertDialog extends StatelessWidget {
  final PlantEntity _plant;

  const DeleteAlertDialog(this._plant, {super.key});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(12);
    const style = TextStyle(color: AppColors.secondaryText);
    final name = _plant.name;
    return AlertDialog(
      backgroundColor: AppColors.button,
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(topRight: radius, bottomLeft: radius)),
      title: const Text("Attention!"),
      content: Text(
          "You are trying to delete plant $name from your garden. Are you sure?"),
      actions: [
        TextButton(
          child: const Text("Cancel", style: style),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("Yes", style: style),
          onPressed: () {
            locator<DeleteMyPlant>().call(_plant).then((value) {
              context.read<MyPlantsBloc>().removePlant(_plant);
              context.showToast('Plant $name was deleted successfully');
            }, onError: (e) {
              context.showToast('Error deleting plant $name');
            });

            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
