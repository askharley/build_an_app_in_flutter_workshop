import 'package:build_an_app_in_flutter_workshop/src/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:build_an_app_in_flutter_workshop/src/ui/shared/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Post', theme: AppTheme.themeData, home: HomeView());
  }
}
