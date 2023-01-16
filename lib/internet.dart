import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Internet extends StatefulWidget {
  const Internet({Key? key}) : super(key: key);

  @override
  State<Internet> createState() => _InternetState();
}

class _InternetState extends State<Internet> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Internet Check"),
            ),
            body: Center(
              child: snapshot.data == ConnectivityResult.none
                  ? Text(
                      "no internet connection ",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    )
                  : Text(
                      "internet connection connect",
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
            ),
          );
        });
  }
}
