import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ThirdType extends StatefulWidget {
  const ThirdType({Key? key}) : super(key: key);

  @override
  State<ThirdType> createState() => _ThirdTypeState();
}

class _ThirdTypeState extends State<ThirdType> {
  late ConnectivityResult olders;
  late StreamSubscription connectivitySubscription;

  @override
  void initState() {
    super.initState();
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult resNow) {
      if (resNow == ConnectivityResult.none) {
        showMyDialog("not connected");
      } else if (olders == ConnectivityResult.none) {
        showMyDialog("connected");
        Navigator.pop(context);
      }
      olders = resNow;
    });
  }

  @override
  void dispose() {
    super.initState();
    connectivitySubscription.cancel();
  }

  showMyDialog(msg) {
    showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Internet Connection'),
              content: Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wifi_off_sharp,
                      color: Colors.blue,
                      size: 80.0,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(msg),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                    child: Center(child: Text("Retry")),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Internet Check"),
        ),
        body: Column(
          children: [
            Text("Third type"),
          ],
        ));
  }
}
