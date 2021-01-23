import 'package:flutter/material.dart';
import 'turkes_hayati.dart';
import 'turkes_sozleri.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Turkes_Dashboard()
  )
);

class Turkes_Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Container(
              child:Image.network("https://cdn.bolgegundem.com/d/news/997743.jpg",fit: BoxFit.fill,
              width : MediaQuery.of(context).size.width,
              height: 200,
            )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                " BAŞBUĞ ALPARSLAN TÜRKEŞ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing:20,
                  runSpacing: 20.0,
                  children: <Widget>[
                    SizedBox(
                      width:160.0,
                      height: 160.0,
                      child: Card(
                        color: Colors.red,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                          
                          child: MaterialButton(
                            onPressed: () =>       Navigator.pushReplacement(
      //Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TurkesHayati()),        
      ),
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                            children: <Widget>[
                           Image.network("https://image.flaticon.com/icons/png/512/49/49041.png",width: 80,height: 80),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Hayatı",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                                ),
                              ),
                            ],
                            ),
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      width:160.0,
                      height: 160.0,
                      child: Card(

                        color: Colors.red,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                            child: MaterialButton(
                              onPressed: (){
                                      Navigator.pushReplacement(
      //Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Turkes_Sozleri()),        
      );
                              },
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.network("https://cdn.iconscout.com/icon/free/png-256/second-life-555849.png",width: 80.0,height: 80.0),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Sözleri",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      width:160.0,
                      height: 160.0,
                      child: Card(

                        color: Colors.red,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                            child: MaterialButton(
                              onPressed: () => null,
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.network("https://cdn2.iconfinder.com/data/icons/picol-vector/32/view-512.png",width: 80.0,height: 80.0),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Resimleri",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      width:160.0,
                      height: 160.0,
                      child: Card(

                        color: Colors.red,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child:Center(
                            child: MaterialButton(
                              onPressed: () => null,
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.network("https://i.ytimg.com/vi/iF0xPHwl7g0/maxresdefault.jpg",width: 120.0,height: 80.0),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Text(
                                    "Apoyla olan dostluğu",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      )
    );
  }
}