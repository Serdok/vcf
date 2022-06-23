import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'LoginScreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.userIsConnected}) : super(key: key);

  final bool userIsConnected;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _scanBarcode = 'Unknown';
  String _marque = 'Unknown';
  String _deEm = 'Unknown';
  String _ena = 'Unknown';
  String _rpc = 'Unknown';
  String _rpp = 'Unknown';
  PageController pageController = PageController();

  @override
  void initState() {
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
      } else if (barcodeScanRes == "3 222270 007962") {
        _scanBarcode = barcodeScanRes;
        _marque = "Friskies (chat)";
        _deEm = "323 Kcal/100g";
        _ena = "37";
        _rpc = "95,97 g/Mkal";
        _rpp = "Inconnu car non calculable";
      } else if (barcodeScanRes == "5 998749 129043") {
        _scanBarcode = barcodeScanRes;
        _marque = "Whiskas (Chat) ";
        _deEm = "340,4 Kcal/100g ";
        _ena = "38,6";
        _rpc = "88,13 g/Mkal ";
        _rpp = "Inconnu car non calculable";
      } else if (barcodeScanRes == "4 008429 086670") {
        _scanBarcode = barcodeScanRes;
        _marque = "Frolic (Chien)";
        _deEm = "341,5 Kcal/100g ";
        _ena = "40,5";
        _rpc = "49,78 g/Mkal  ";
        _rpp = "18,9 = Seuil déconseillé ";
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
                  Visibility(visible: !widget.userIsConnected,
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      },
                      child: const Text("Login",
                          style:
                          TextStyle(color: Colors.white, fontSize: 18.0))),),
                  ElevatedButton(
                      onPressed: () => scanBarcodeNormal(),
                      child: const Text('Lancer le scan',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  Text('Scan result : $_scanBarcode\n',
                      style: const TextStyle(fontSize: 20)),
                  Text('Marque : $_marque\n',
                      style: const TextStyle(fontSize: 20)),
                  Text('DE/EM : $_deEm\n',
                      style: const TextStyle(fontSize: 20)),
                  Text('ENA : $_ena\n',
                      style: const TextStyle(fontSize: 20)),
                  Text('RPC : $_rpc\n',
                      style: const TextStyle(fontSize: 20)),
                  Text('RPP : $_rpp\n',
                      style: const TextStyle(fontSize: 20)),
                ]));
      }),
    ));
  }
}
