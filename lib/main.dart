import 'package:earno_calc/Mainscreen.dart';
import 'package:earno_calc/models/categories/category_model.dart';
import 'package:earno_calc/screens/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();  
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId))
  {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if(!Hive.isAdapterRegistered(CategorymodelAdapter().typeId))
    {
      Hive.registerAdapter(CategorymodelAdapter());
    }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
           theme: ThemeData.dark(),

    home: MainScreen(),
    );
  }
}

