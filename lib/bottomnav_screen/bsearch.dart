import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bsearch extends StatefulWidget {
  const Bsearch({super.key});

  @override
  State<Bsearch> createState() => _BsearchState();
}

class _BsearchState extends State<Bsearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Bottom Search")));
  }
}
