import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/pages/garden/bloc/all_plants_bloc.dart';
import 'package:sunflower/feature/presentation/pages/garden/bloc/plants_event.dart';
import 'package:sunflower/feature/presentation/pages/garden/bloc/plants_state.dart';
import 'package:sunflower/feature/presentation/pages/garden/widgets/plant_list_widget.dart';
import 'package:sunflower/feature/presentation/widgets/info_widget.dart';
import 'package:sunflower/feature/presentation/widgets/progress_widget.dart';
import 'package:sunflower/feature/presentation/widgets/retry_widget.dart';

class AllPlantsTab extends StatelessWidget {
  const AllPlantsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllPlantsBloc, PlantsState>(
      listener: ((context, state) {
        debugPrint('AllPlantsTab.listener: state - $state');
      }),
      builder: (context, state) {
        if (state is PlantsEmptyState) {
          return const AppInfoText(text: 'Empty list');
        }
        if (state is PlantsFailureState) {
          return AppRetry('Error loading', onPressed: () {
            context.read<AllPlantsBloc>().add(PlantsLoadEvent());
          });
        }
        if (state is PlantsLoadingState) {
          return const AppProgress();
        }
        List<PlantEntity> plants = [];
        if (state is PlantsLoadedState) {
          plants = state.plants;
        }
        return PlantList(plants);
      },
    );
  }
}
