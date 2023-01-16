import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class SecondType extends StatefulWidget {
  const SecondType({Key? key}) : super(key: key);

  @override
  State<SecondType> createState() => _SecondTypeState();
}

class _SecondTypeState extends State<SecondType> {
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;
  @override
  void initState() {
    super.initState();
    startStreaming();
  }

  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      isConnected = false;
      showMyDialog();
    } else {
      isConnected = true;
    }
  }

  showMyDialog() {
    showDialog(
        barrierDismissible: false,
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
                    Text('Please Check Your InterNet Connection'),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                    child: Center(child: Text("Retry")),
                    onPressed: () {
                      Navigator.pop(context);
                      checkInternet();
                    })
              ],
            ));
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      checkInternet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Internet Check"),
        ),
        body: Column(
          children: [
            Image.asset('assets/img/network.svg'),
            Text("Manoj"),
          ],
        ));
  }
}
