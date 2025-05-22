import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bdocument extends StatefulWidget {
  const Bdocument({super.key});

  @override
  State<Bdocument> createState() => _BdocumentState();
}

class _BdocumentState extends State<Bdocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Bottom Document")));
  }
}
