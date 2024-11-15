import 'package:flutter/material.dart';
import 'package:kitties_app/providers/breed_provider.dart';
import 'package:kitties_app/screens/cat_lists_screen.dart';
import 'package:kitties_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[ChangeNotifierProvider(create: (_) => new BreedProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cat Breeds',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:  SplashScreen(nextScreen: CatListScreen()),
      ),
    );
  }
}