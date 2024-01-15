import 'package:docs_reader/Screens/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:power_file_view/power_file_view.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  PowerFileViewManager.initEngine();
  runApp(const MyApp());
}
double screenHeight = 0; 
double screenWidth = 0; 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // localizationsDelegates: <LocalizationsDelegate<dynamic>>[
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   FileViewLocalizationsDelegate.delegate,
      // ],
      home: SpalshScreen(),
    );
  }
}