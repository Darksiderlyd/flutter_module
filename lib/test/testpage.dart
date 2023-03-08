import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class SimplePage extends StatelessWidget {
  const SimplePage({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    Logger.log(title ?? '');
    return const Scaffold(
      body: Center(child: Text('SimplePage')),
    );
  }
}