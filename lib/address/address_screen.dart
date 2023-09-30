import 'package:flutter/material.dart';
import 'package:flutterassignment/address/ui/button.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /// TOOD: progress bar
              Container(
                child: Form(
                  key: _formKey,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(addressScreenBody),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: countryHint,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: prefectureHint,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: municipalityHint,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: streetAddressHint,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: apartmentHint,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Button(),
            ],
          ),
        ),
      ),
    );
  }
}
