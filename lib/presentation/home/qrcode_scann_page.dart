import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class MobileScannerPage extends StatefulWidget {
  const MobileScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _MobileScannerPageState();
}

class _MobileScannerPageState extends State<MobileScannerPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                    Text(
                      "Lecture de la carte",
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall!.copyWith(color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () => controller?.toggleFlash(),
                      icon: const Icon(Icons.flash_on, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (result != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}',
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 0,
        cutOutHeight: 250,
        cutOutWidth: MediaQuery.of(context).size.width * 0.95,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('no Permission')));
    }
  }
}
