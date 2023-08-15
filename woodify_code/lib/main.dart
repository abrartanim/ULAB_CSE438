import 'package:flutter/material.dart';
import 'package:woodify/screens/login.dart';


import 'mongodb.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Woodify', home: Login(),
    );
  }
}

