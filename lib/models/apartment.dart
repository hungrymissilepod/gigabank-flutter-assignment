import 'package:formz/formz.dart';

enum ApartmentValidationError { invalid }

final class Apartment extends FormzInput<String, ApartmentValidationError> {
  const Apartment.pure([super.value = '']) : super.pure();
  const Apartment.dirty([super.value = '']) : super.dirty();

  @override
  ApartmentValidationError? validator(String value) {
    return value.isEmpty ? ApartmentValidationError.invalid : null;
  }
}
