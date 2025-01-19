import 'package:flutter/material.dart';

class Document extends StatefulWidget {
  const Document({super.key});

  @override
  State<Document> createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Document Page"),
    );
  }
}
