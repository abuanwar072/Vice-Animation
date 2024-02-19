import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app/vice_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const ViceApp());
}
