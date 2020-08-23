import 'package:Be_organized/Api/Chopper_api.dart';
import 'package:Be_organized/Router/sailor__Router.dart';
import 'package:Be_organized/Stores/SampleMobx.dart';
import 'screens/Test_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Routes.createRoutes();
  runApp(MyApp());
}

// this is my initial COMMIted So Be carfull of course !== => fklsdj
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [   Provider(
          create: (context) => ApiService.create(),
          dispose: (_, ApiService service) => service.client.dispose(),
        ),
        Provider(
          create: (_) => SampleStore(), // this is sample Mobx Store.
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BoilerPlate Kit',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: Routes.sailor.generator(),
        navigatorKey: Routes.sailor.navigatorKey,
        home: TestScreen(),
      ),
    );
  }
}
