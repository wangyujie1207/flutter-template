import 'package:flutter/material.dart';

import 'qrcode_reader_view.dart';

class ScanViewPage extends StatefulWidget {
  const ScanViewPage({Key? key}) : super(key: key);

  @override
  _ScanViewPageState createState() => new _ScanViewPageState();
}

class _ScanViewPageState extends State<ScanViewPage> {
  final GlobalKey<QrcodeReaderViewState> _key = GlobalKey();
  int isOnce = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QrcodeReaderView(
        key: _key,
        onScan: onScan,
        headerWidget: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
    );
  }

  Future onScan(String data) async {
    if(data.isNotEmpty){
      setState(() {
        isOnce++;
      });
    }
    if(isOnce <= 1){
      Navigator.pop(context, data);
    }
    _key.currentState!.startScan();

  }

  @override
  void dispose() {
    super.dispose();
  }
}
