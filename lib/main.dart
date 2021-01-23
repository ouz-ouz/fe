import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mhp_app/scenes/login.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Firebasemain());
}

class Firebasemain extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  //servis Bağlantıyı Gerçekleştirir

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("HATA Bağlantı sağlanamadı!"), // bağlantı gerçekleşmezse Bu Scafold döndürür
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return LoginApp();  // Bağlantı Sağlanır ve Uyguluma Giriş sayfası döner
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold( // Bağlantı esnasında load verir
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}