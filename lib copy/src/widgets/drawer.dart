import 'package:appgas/src/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appgas/src/bloc/navigation_bloc/navigation_bloc.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Applicaion gas"),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              Divider(
                height: 32,
                thickness: 0.5,
                color: Colors.white.withOpacity(0.3),
                indent: 16,
                endIndent: 16,
              ),
              MenuItem(
                icon: Icons.home,
                title: "Home",
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationEvents.HomePageClickedEvent);
                  Navigator.pop(context);
                },
              ),
              MenuItem(
                icon: Icons.home,
                title: "Pedidos",
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationEvents.MisPedidosEvent);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Positioned(
            child: Container(child: Center(child: Text("Emergencia"))),
            bottom: 0,
          )
        ],
      ),
    );
  }
}
