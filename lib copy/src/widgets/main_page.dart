import 'package:appgas/src/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:appgas/src/widgets/drawer.dart';
import 'package:appgas/src/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      body: BlocBuilder<NavigationBloc, NavigationStates>(
        builder: (context, navigationState) {
          return navigationState as Widget;
        },
      ),
      appBar: AppBar(
        //backgroundColor: Color(0x44000000),
        // backgroundColor: Colors.black12,
        // elevation: 0,
        title: Text("Title"),
      ),
    );
  }
}
