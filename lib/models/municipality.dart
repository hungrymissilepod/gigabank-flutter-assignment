import 'package:formz/formz.dart';

enum MunicipalityValidationError { invalid }

final class Municipality extends FormzInput<String, MunicipalityValidationError> {
  const Municipality.pure([super.value = '']) : super.pure();
  const Municipality.dirty([super.value = '']) : super.dirty();

  @override
  MunicipalityValidationError? validator(String value) {
    return value.isEmpty ? MunicipalityValidationError.invalid : null;
  }
}
