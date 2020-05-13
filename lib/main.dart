import 'package:appgas/screens/mis_datos.dart';
import 'package:appgas/screens/productos.dart';
import 'package:appgas/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// class DrawerItem {
//   String title;
//   IconData icon;
//   Function onTap;
//   DrawerItem({this.title, this.icon, this.onTap});
// }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDrawerIndex = 0;

  _getLocation() async {
    Position position;
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      print(position.latitude);
      print(position.altitude);
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        var error = 'Permission denied';
      }
      position = null;
    }
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-13.5226400, -71.9673400),
    zoom: 14.4746,
  );

  _onSelectItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation();
  }

  List<DrawerItem> drawerItemsLista(BuildContext context) {
    return [
      new DrawerItem(
          title: "Pedir Balon",
          icon: Icons.account_balance,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MisDAtos()))),
      new DrawerItem(
          title: "Mis Datos",
          icon: Icons.account_balance,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MisDAtos()))),
      new DrawerItem(
          title: "Productos",
          icon: Icons.account_balance,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MisDAtos()))),
      new DrawerItem(
          title: "Mis Pedidos",
          icon: Icons.account_balance,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MisDAtos()))),
      new DrawerItem(
          title: "Accesorios",
          icon: Icons.account_balance,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MisDAtos()))),
      new DrawerItem(
          title: "REcomendaciones",
          icon: Icons.account_balance,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MisDAtos()))),
      new DrawerItem(
          title: "Premios",
          icon: Icons.account_balance,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MisDAtos()))),
      new DrawerItem(
          title: "Facebook",
          icon: Icons.account_balance,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MisDAtos()))),
      new DrawerItem(
          title: "Salir",
          icon: Icons.account_balance,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MisDAtos()))),
      new DrawerItem(
          title: "Emergencia",
          icon: Icons.warning,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MisDAtos()))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<DrawerItem> drawerItems = drawerItemsLista(context);
    List<Widget> drawerOptions = [];
    for (int i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(d);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("GAS"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[200]),
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Icon(
                  Icons.account_circle,
                  color: Colors.blue.shade800,
                  size: 96,
                ),
              ),
            ),
            // for (int i = 0; i < drawerItems.length; i++) drawerItems[i],
            new DrawerItem(
              title: "Pedir Balon",
              icon: Icons.account_balance,
              onTap: () => Navigator.pop(context),
            ),
            new DrawerItem(
                title: "Mis Datos",
                icon: Icons.account_balance,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MisDAtos()))),
            new DrawerItem(
                title: "Productos",
                icon: Icons.account_balance,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MisProductos()))),
            new DrawerItem(
                title: "Mis Pedidos",
                icon: Icons.account_balance,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MisDAtos()))),
            new DrawerItem(
                title: "Accesorios",
                icon: Icons.account_balance,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MisDAtos()))),
            new DrawerItem(
                title: "REcomendaciones",
                icon: Icons.account_balance,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MisDAtos()))),
            new DrawerItem(
                title: "Premios",
                icon: Icons.account_balance,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MisDAtos()))),
            new DrawerItem(
                title: "Facebook",
                icon: Icons.account_balance,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MisDAtos()))),
            new DrawerItem(
                title: "Salir",
                icon: Icons.account_balance,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MisDAtos()))),
            new DrawerItem(
                title: "Emergencia",
                icon: Icons.warning,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MisDAtos()))),
          ],
        ),
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _whatsAppOpen,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _whatsAppOpen() async {
    String phoneNumber = "+51992418538";
    String message = "hola";
    var whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=$message";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'No se pede abrir $whatsappUrl';
    }
  }
}
