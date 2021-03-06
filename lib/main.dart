import 'package:aerochallenge_app/screens/game/done_bloc.dart';
import 'package:aerochallenge_app/screens/home_page/home_page.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/timer_lvl1/timer_bloc_1.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/timer_lvl2/timer_bloc_2.dart';
import 'package:aerochallenge_app/widgets/obstacles/wtc/counter_bloc.dart';
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TimerBloc(),
        ),
        ChangeNotifierProvider(
          create: (context) => CounterBloc(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuschwitzTimerBloc1(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuschwitzTimerBloc2(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoneBloc(),
        ),
      ],
      child: DevicePreview(
        enabled: false,
        builder: (context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      title: 'Aerochallenge',
      home: HomePage(),
    );
  }
}
