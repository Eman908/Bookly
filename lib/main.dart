import 'package:bookly/core/utils/bloc_observer.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/run_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  setupServiceLocator();
  runApp(const Bookly());
}
