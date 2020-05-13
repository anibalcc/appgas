import 'package:appgas/src/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:appgas/src/widgets/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(),
      child: MainPage(),
    );
  }
}