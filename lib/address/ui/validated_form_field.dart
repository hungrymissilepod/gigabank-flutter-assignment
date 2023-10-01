import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignment/address/bloc/address_form_bloc.dart';

class ValidatedFormField extends StatelessWidget {
  const ValidatedFormField({
    super.key,
    required this.initialValue,
    required this.hintText,
    required this.errorText,
    required this.onChanged,
  });

  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressFormBloc, AddressFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
                width: 2,
              ),
            ),
          ),
          textInputAction: TextInputAction.next,
          onChanged: onChanged,
        );
      },
    );
  }
}
