import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:woodify/check.dart';
import 'package:woodify/screens/buyer/homepage.dart';

import 'package:woodify/screens/login.dart';
import 'package:woodify/screens/seller/add_pro.dart';
import 'package:woodify/screens/seller/homepage.dart';


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
    return MaterialApp(title: 'Woodify', home: Homepage(),
    );
  }
}

