import 'package:flutter/material.dart';
import 'package:future_builder_app/widget/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

int NumberofUsersDisplayed(int number) {
      return 6;
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: HomePage());
  }
}
