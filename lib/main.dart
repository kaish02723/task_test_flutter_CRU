import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_test2/provider_controller/add_user_provider.dart';
import 'package:task_test2/provider_controller/edit_user_provider.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AddUserProvider(),),
      ChangeNotifierProvider(create: (context) => EditDetailProvider(),),
    ],child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    ),);
  }
}


