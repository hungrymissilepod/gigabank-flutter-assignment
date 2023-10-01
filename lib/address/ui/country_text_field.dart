import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignment/address/bloc/address_form_bloc.dart';
import 'package:flutterassignment/strings.dart';

class CountryTextField extends StatelessWidget {
  const CountryTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressFormBloc, AddressFormState>(
      builder: (context, state) {
        return EasyAutocomplete(
          suggestions: <String>[
            'Afeganistan',
            'Albania',
            'Algeria',
            'Australia',
            'Brazil',
            'German',
            'Madagascar',
            'Mozambique',
            'Portugal',
            'Zambia'
          ],
          initialValue: state.country.value,
          onChanged: (value) {
            context.read<AddressFormBloc>().add(CountryChanged(country: value));
          },
          onSubmitted: (value) {
            context.read<AddressFormBloc>().add(CountryChanged(country: value));
          },
          decoration: InputDecoration(
              hintText: countryHint,
              errorText: state.country.displayError != null ? countryError : null,
              hintStyle: const TextStyle(fontSize: 18),
              labelStyle: const TextStyle(fontSize: 18),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                  width: 2,
                ),
              ),
              suffixIcon: const Icon(Icons.search)),
          suggestionBuilder: (data) {
            return Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                data,
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
        );
      },
    );
  }
}
