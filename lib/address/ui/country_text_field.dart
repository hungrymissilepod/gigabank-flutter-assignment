import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignment/address/bloc/address_form_bloc.dart';
import 'package:flutterassignment/strings.dart';
import 'package:countries_utils/countries_utils.dart';

class CountryTextField extends StatelessWidget {
  CountryTextField({super.key});

  final List<Country> countries = Countries.all();

  String _getFlagForCountry(String country) {
    int index = countries.indexWhere((element) => element.name == country);
    if (index != -1) {
      return countries[index].flagIcon ?? '';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressFormBloc, AddressFormState>(
      builder: (context, state) {
        return EasyAutocomplete(
          suggestions: countries.map((e) => e.name!).toList(),
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
                // color: Colors.purple,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: <Widget>[
                  Flexible(child: Text(_getFlagForCountry(data))),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      data,
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
