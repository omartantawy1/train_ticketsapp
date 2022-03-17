import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qrCode extends StatefulWidget {
bool qrVisible;
qrCode({this.qrVisible=false});

  @override
  State<qrCode> createState() => _qrCodeState();
}

class _qrCodeState extends State<qrCode> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:widget.qrVisible,
      child: Container(
        child: QrImage(
          data: "Cairo->Banha",
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}
