import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignment/address/bloc/address_form_bloc.dart';
import 'package:flutterassignment/address/ui/button.dart';
import 'package:flutterassignment/address/ui/country_text_field.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddressFormBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(addressScreenTitle),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
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
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: Text(addressScreenBody),
                            ),
                            const CountryTextField(),
                            ValidatedFormField(
                              initialValue: state.prefecture.value,
                              hintText: prefectureHint,
                              errorText: state.prefecture.displayError != null ? prefectureError : null,
                              onChanged: (value) {
                                context.read<AddressFormBloc>().add(PrefectureChanged(prefecture: value));
                              },
                            ),
                            ValidatedFormField(
                              initialValue: state.municipality.value,
                              hintText: municipalityHint,
                              errorText: state.municipality.displayError != null ? municipalityError : null,
                              onChanged: (value) {
                                context.read<AddressFormBloc>().add(MunicipalityChanged(municipality: value));
                              },
                            ),
                            ValidatedFormField(
                              initialValue: state.streetAddress.value,
                              hintText: streetAddressHint,
                              errorText: state.streetAddress.displayError != null ? streetAddressError : null,
                              onChanged: (value) {
                                context.read<AddressFormBloc>().add(StreetAddressChanged(streetAddress: value));
                              },
                            ),
                            ValidatedFormField(
                              initialValue: state.apartment.value,
                              hintText: apartmentHint,
                              errorText: state.apartment.displayError != null ? apartmentError : null,
                              onChanged: (value) {
                                context.read<AddressFormBloc>().add(ApartmentChanged(apartment: value));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Button(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
