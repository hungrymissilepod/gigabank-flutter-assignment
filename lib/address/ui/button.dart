import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignment/address/bloc/address_form_bloc.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressFormBloc, AddressFormState>(builder: (context, state) {
      return TextButton(
        /// TODO: ensure we have enabled and disabled states for this button
        // onPressed: state.isValid
        //     ? () {
        //         context.read<AddressFormBloc>().add(FormSubmitted());
        //       }
        //     : null,

        onPressed: () {
          context.read<AddressFormBloc>().add(FormSubmitted());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),

        /// TODO: clean up this styling code
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
      );
    });
  }
}
