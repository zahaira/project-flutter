import 'package:corail/common/variable.dart';
import 'package:corail/pages/navigationPages/Tickets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:url_launcher/url_launcher.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({
    super.key,
  });
  @override
  State<ScanQr> createState() => _scanState();
}

class _scanState extends State<ScanQr> {
  String? getResult = '';
  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch =
        Uri(scheme: 'https', host: 'chocolate-shena-28.tiiny.site', path: '/');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scanner Votre Qr Code'),
          backgroundColor: const Color(0xff00587a),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 180,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19.46335792541504),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [secondColor, const Color(0x66ffffff)],
                  ),
                ),
                child: Image.asset(
                  "$pathImages/qrCode.png",
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  onPressed: () {
                    scanQRCode();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          mainColor,
                          mainColor
                        ], // Define your gradient colors here
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      constraints:
                          const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Scanner',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (getResult!.isNotEmpty && getResult != '-1')
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        getResult!,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            child: ElevatedButton(
                              onPressed: () => setState(() {
                                _launched = _launchInBrowser(toLaunch);
                              }),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  side: const BorderSide(
                                      color: Color(0xFF00587A))),
                              child: const Text(
                                'Consulter le lien',
                                style: TextStyle(color: Color(0xFF00587A)),
                              ),
                            ),
                          ),
                          InkWell(
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Tickets(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      side: const BorderSide(
                                          color: Color(0xFF00587A))),
                                  child: const Text(
                                    'Ajouter ce ticket',
                                    style: TextStyle(color: Color(0xFF00587A)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6547', 'Annuler', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        getResult = qrCode;
      });
      print('qr code result!..000');
      print(qrCode);
    } on PlatformException {
      getResult = 'failed to scan qr code';
    }
  }
}
