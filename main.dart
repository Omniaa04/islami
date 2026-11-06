

import 'package:flutter/material.dart';
import 'package:islami/onboarding.dart';
import 'package:islami/sebha.dart';

void main() => runApp(const SpaceApp());

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami App',
      home: Sebha(),
    );
  }
}
