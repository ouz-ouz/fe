import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
          child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.habergazetesi.com.tr%2Fresimler%2F20012021%2Fc2d8c99e0m.jpg&f=1&nofb=1"),
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text("MHP heyetinden Kadim Aşiretler Federasyonuna ziyaret "),
                        subtitle: Text("Milliyetçi Hareket Partisi (MHP) Van İl Başkanı Salih Güngöralp ve beraberindeki heyet, Kadim Aşiretler Federasyonu Başkanı Rasim Aslan ve üst kurul üyelerini ziyaret etti."),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                              onPressed:  () async {
                              },
                              child: Text("devamını oku",textAlign: TextAlign.right,)),
                        ],
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}