import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/pages/garden/bloc/my_plants_bloc.dart';
import 'package:sunflower/feature/presentation/pages/garden/bloc/plants_state.dart';
import 'package:sunflower/feature/presentation/pages/garden/widgets/plant_list_widget.dart';
import 'package:sunflower/feature/presentation/widgets/info_widget.dart';
import 'package:sunflower/feature/presentation/widgets/progress_widget.dart';
import 'package:sunflower/feature/presentation/widgets/retry.dart';

class MyPlantsTab extends StatelessWidget {
  final VoidCallback? onRequestData;

  const MyPlantsTab({Key? key, this.onRequestData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyPlantsBloc, PlantsState>(
      listener: ((context, state) {
        debugPrint('MyPlantsTab.listener: state - $state');
      }),
      builder: (context, state) {
        if (state is PlantsEmptyState) {
          return AppRetry('Your garden is empty',
              textButton: 'Add plant', onPressed: onRequestData);
        }
        if (state is PlantsFailureState) {
          return const AppInfoText(text: 'The database is not available'); // TODO
        }
        if (state is PlantsLoadingState) {
          return const AppProgress();
        }
        List<PlantEntity> plants = [];
        if (state is PlantsLoadedState) {
          plants = state.plants;
        }
        return PlantList(plants, isExtended: true);
      },
    );
  }
}
