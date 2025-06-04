import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/run_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(const Bookly());
}
