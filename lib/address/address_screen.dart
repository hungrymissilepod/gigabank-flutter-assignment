import 'package:flutter/material.dart';
import 'package:flutterassignment/strings.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addressScreenTitle),
      ),
      body: Column(
        children: <Widget>[
          /// TOOD: progress bar
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
