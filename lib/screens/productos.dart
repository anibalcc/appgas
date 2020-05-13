import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MisProductos extends StatefulWidget {
  @override
  _MisProductosState createState() => _MisProductosState();
}

class _MisProductosState extends State<MisProductos> {
  _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    print(snapshot);
    return ListView.builder(
      padding: EdgeInsets.only(top: 20.0),
      //children: snapshot.map((data) => _buildListItem(data)).toList(),
      itemCount: snapshot.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListItem(snapshot[index]);
      },
    );
  }

  _buildListItem(DocumentSnapshot data) {
    print(data);
    return Container(
      child: Column(
        children: <Widget>[
          Text(data['cantidad'].toString()),
          Text(data['nombre']),
          Image.network(data['prodImage']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mis Productos"),
        ),
        body: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('productos').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();
              return _buildList(context, snapshot.data.documents);
            },
          ),
        ));
  }
}
