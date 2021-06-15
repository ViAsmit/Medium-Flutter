import 'package:flutter/material.dart';
import "package:flutter_mce/flutter_mce.dart";

class EditorScreen extends StatefulWidget {
  @override
  _EditorScreenState createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMCE(),
    );
  }
}
