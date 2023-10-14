import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/core/locator.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/feature/domain/usecases/get_all_plants.dart';
import 'package:sunflower/feature/presentation/bloc/all_plants_bloc.dart';
import 'package:sunflower/feature/presentation/bloc/plants_event.dart';
import 'package:sunflower/feature/presentation/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AllPlantsBloc(getAllPlants: locator<GetAllPlants>())
                  ..add(PlantsLoadEvent())),
      ],
      child: MaterialApp(
          title: 'Sunflower',
          theme: ThemeData(primarySwatch: AppColors.primary),
          onGenerateRoute: router),
    );
  }
}
