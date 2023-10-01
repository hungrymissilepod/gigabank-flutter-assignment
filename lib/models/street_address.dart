import 'package:formz/formz.dart';

enum StreetAddressValidationError { invalid }

final class StreetAddress extends FormzInput<String, StreetAddressValidationError> {
  const StreetAddress.pure([super.value = '']) : super.pure();
  const StreetAddress.dirty([super.value = '']) : super.dirty();

  @override
  StreetAddressValidationError? validator(String value) {
    /// Ensure that [value] is in the [subarea-block-house] format
    final RegExp regExp = RegExp(r'[0-9]+-[0-9]+-[0-9]+');
    if (regExp.hasMatch(value) == false) {
      return StreetAddressValidationError.invalid;
    }
    return null;
  }
}
