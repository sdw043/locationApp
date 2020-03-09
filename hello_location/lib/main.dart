import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';

void main() => runApp(App());

class App extends StatefulWidget {
  @override 
  _AppState createState() => _AppState(); 
}

class _AppState extends State<App> {

  String _locationMessage = ""; 

  void _getCurrentLocation() async {

    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print(position);

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });
  }

//  void _connectToPi() async {
//    int portNo = 12345;
//    Socket.connect('192.169.1.143', portNo).then((socket) {
//      if(socket == null){
//        print("something very wrong happened with your socket, sir!");
//      }
//      else{
//        socket.write('pinging mr. pi!');
//        print('pinging the pi right now');
//      }
//    });
//  }

  void _connectToPi() async {
    int portNo = 12345;
    //RawSocket()
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Location Services")
        ),
        body: Align(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(_locationMessage, style: TextStyle(fontSize: 30),),
            FlatButton(
              onPressed: () {
                for(int i = 0; i < 4; i++){
                  _getCurrentLocation();
                }
                _connectToPi();
              },
              color: Colors.green,
              child: Text("Find Location", style: TextStyle(fontSize: 50),)
            )
          ]),
        )
      )
    );
  }
}
