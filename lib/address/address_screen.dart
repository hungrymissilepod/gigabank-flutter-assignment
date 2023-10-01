import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignment/address/bloc/address_form_bloc.dart';
import 'package:flutterassignment/address/ui/button.dart';
import 'package:flutterassignment/address/ui/validated_form_field.dart';
import 'package:flutterassignment/strings.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final FocusNode _countryFocusNode = FocusNode();
  final FocusNode _prefectureFocusNode = FocusNode();
  final FocusNode _municipalityFocusNode = FocusNode();

  @override
  void dispose() {
    _countryFocusNode.dispose();
    _prefectureFocusNode.dispose();
    _municipalityFocusNode.dispose();
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
            BlocBuilder<AddressFormBloc, AddressFormState>(
              builder: (context, state) {
                return Container(
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
                            ValidatedFormField(
                              focusNode: _countryFocusNode,
                              initialValue: state.country.value,
                              hintText: countryHint,
                              errorText: state.country.displayError != null ? 'Please enter a valid country' : null,
                              onChanged: (value) {
                                context.read<AddressFormBloc>().add(CountryChanged(country: value));
                              },
                            ),
                            ValidatedFormField(
                              focusNode: _prefectureFocusNode,
                              initialValue: state.prefecture.value,
                              hintText: prefectureHint,
                              errorText: state.country.displayError != null ? 'Please enter a valid prefecture' : null,
                              onChanged: (value) {
                                context.read<AddressFormBloc>().add(PrefectureChanged(prefecture: value));
                              },
                            ),
                            ValidatedFormField(
                              focusNode: _municipalityFocusNode,
                              initialValue: state.municipality.value,
                              hintText: municipalityHint,
                              errorText:
                                  state.municipality.displayError != null ? 'Please enter a valid municipality' : null,
                              onChanged: (value) {
                                context.read<AddressFormBloc>().add(MunicipalityChanged(municipality: value));
                              },
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
                );
              },
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
