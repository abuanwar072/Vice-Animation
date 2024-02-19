import 'package:flutter/material.dart';

import '../core.dart';

class ViceTheme {
  const ViceTheme._();

  static ThemeData get theme => ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: ViceColors.purple,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white54,
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
        ),
      );
}
