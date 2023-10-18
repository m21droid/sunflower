import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/core/locator.dart';
import 'package:sunflower/core/res/colors.dart';
import 'package:sunflower/feature/domain/usecases/get_all_plants.dart';
import 'package:sunflower/feature/domain/usecases/get_my_plants.dart';
import 'package:sunflower/feature/presentation/bloc/all_plants_bloc.dart';
import 'package:sunflower/feature/presentation/bloc/my_plants_bloc.dart';
import 'package:sunflower/feature/presentation/bloc/plants_event.dart';
import 'package:sunflower/feature/presentation/pages/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint('_MyAppState.didChangeAppLifecycleState: state - $state');
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      _setTransparentBars();
    }
  }

  @override
  Widget build(BuildContext context) {
    _setTransparentBars();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                MyPlantsBloc(getMyPlants: locator<GetMyPlants>())..load()),
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

  // Transparent status and navigation bars
  void _setTransparentBars() {
    const systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
