import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignment/address/bloc/address_form_bloc.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressFormBloc, AddressFormState>(
      builder: (context, state) {
        return TextButton(
          onPressed: state.country.value.isEmpty
              ? null
              : () {
                  context.read<AddressFormBloc>().add(FormSubmitted());
                },

          /// TODO: clean up this button styling
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return Theme.of(context).disabledColor;
                }
                return Theme.of(context).colorScheme.primary;
              },
            ),
            shape: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      width: 0,
                      color: Theme.of(context).disabledColor,
                    ),
                  );
                }
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Next',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
