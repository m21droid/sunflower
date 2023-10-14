import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/feature/domain/entities/plant_entity.dart';
import 'package:sunflower/feature/presentation/bloc/all_plants_bloc.dart';
import 'package:sunflower/feature/presentation/bloc/plants_state.dart';
import 'package:sunflower/feature/presentation/widgets/plant_line.dart';

class PlantList extends StatelessWidget {
  const PlantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllPlantsBloc, PlantsState>(
      listener: ((context, state) {
        log(state.toString());
      }),
      builder: (context, state) {
        if (state is PlantsEmptyState) {
          return const SizedBox.shrink();
        }
        if (state is PlantsFailureState) {
          return const Center(
            child: Text('Error loading', style: TextStyle(fontSize: 24)),
          );
        }
        if (state is PlantsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<PlantEntity> plants = [];
        if (state is PlantsLoadedState) {
          plants = state.plants;
        }
        final itemCount = plants.length;
        return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemBuilder: (contex, index) {
              final i = index + 1;
              if (index % 2 == 0) {
                final key = Key('Line $index');
                final plant1 = plants[index];
                final plant2 = (i < itemCount) ? plants[i] : null;
                return PlantLine(key: key, plant1: plant1, plant2: plant2);
              } else {
                final height = (i == itemCount) ? 0.0 : 16.0;
                return SizedBox(height: height);
              }
            },
            itemCount: itemCount);
      },
    );
  }
}
