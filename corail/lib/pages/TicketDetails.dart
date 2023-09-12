import 'dart:io';

import 'package:corail/common/variable.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketDetails extends StatefulWidget {
  const TicketDetails({super.key});

  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
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
          title: const Text('Details de Votre Ticket'),
          toolbarHeight: 80,
          backgroundColor: const Color(0xff00587a),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 44),
                    padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
                    width: double.infinity,
                    height: 400,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Icon(Icons.add),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Icon(Icons.remove),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    _launched = _launchInBrowser(toLaunch);
                                  }),
                                  child: const MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Icon(Icons.download),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          constraints: const BoxConstraints(
                            maxHeight: 310,
                          ),
                          child: Image.asset('$pathImages/ticket.jpg'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
