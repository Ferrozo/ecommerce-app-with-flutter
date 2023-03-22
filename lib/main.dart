import 'package:ecommerce_app_with_flutter/src/presentation/screens/export_screens.dart';
import 'package:ecommerce_app_with_flutter/src/services/api_call_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  APICallService.getProduct();
  runApp(const App());
}
