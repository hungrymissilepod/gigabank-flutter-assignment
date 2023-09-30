import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignment/address/bloc/address_form_bloc.dart';
import 'package:flutterassignment/address/ui/button.dart';
import 'package:flutterassignment/strings.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  final FocusNode _countryFocusNode = FocusNode();

  @override
  void dispose() {
    _countryFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddressFormBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(addressScreenTitle),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              percent: 0.5,
              progressColor: Theme.of(context).colorScheme.secondary,
              backgroundColor: Colors.grey.shade100,
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Text(addressScreenBody),
                          ),
                          BlocBuilder<AddressFormBloc, AddressFormState>(
                            builder: (context, state) {
                              return TextFormField(
                                initialValue: state.country.value,
                                focusNode: _countryFocusNode,
                                decoration: InputDecoration(
                                  hintText: countryHint,
                                  errorText: state.country.displayError != null ? 'Please enter a valid country' : null,
                                ),
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  context.read<AddressFormBloc>().add(CountryChanged(country: value));
                                },
                              );
                            },
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
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Button(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
