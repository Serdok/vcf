import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LoginScreen.dart';

class Home extends StatefulWidget {
  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _scanBarcode = 'Unknown';
  PageController pageController = PageController();
  bool userConnected = false;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        userConnected = user != null;
      });
    });
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      if (barcodeScanRes == "-1") {
        _scanBarcode = "Unknown";
      } else {
        _scanBarcode = barcodeScanRes;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return MaterialApp(home: Scaffold(
      body: Builder(builder: (BuildContext context) {
        return Container(
            alignment: Alignment.center,
            child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      child: FractionallySizedBox(
                    widthFactor: 0.6,
                    heightFactor: 0.6,
                    child: Image.asset('assets/images/logoVCF.png'),
                  )),
                  ElevatedButton(
                      onPressed: () => scanBarcodeNormal(),
                      child: Text('Lancer le scan',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      child: const Text("Login",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  Text('Scan result : $_scanBarcode\n',
                      style: TextStyle(fontSize: 20)),
                ]));
      }),
    ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
