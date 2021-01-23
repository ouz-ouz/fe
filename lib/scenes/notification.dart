import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {

  List<int> listeNumaralari   =   List.generate(30, (index) => index);
  List<String> listeAltBaslik =   List.generate(30,(index)  => "Liste elemanı alt baslik $index");


  @override
  Widget build(BuildContext context) {
    return ListView(children: listeNumaralari.map((e) => Container(
      child: Card(
        color: Colors.teal.shade500,
        margin: EdgeInsets.all(20),
        elevation: 10,
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.access_alarm, color: Colors.white),
            radius: 24,
          ),
          title: Text("Liste eleman baslik $e"),
          subtitle: Text(listeAltBaslik[e]),
          trailing: Icon(Icons.add_circle),
        ),
      ),
    ),).toList(),

    );
  }
}