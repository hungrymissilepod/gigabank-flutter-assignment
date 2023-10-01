import 'package:formz/formz.dart';

enum PrefectureValidationError { invalid }

final class Prefecture extends FormzInput<String, PrefectureValidationError> {
  const Prefecture.pure([super.value = '']) : super.pure();
  const Prefecture.dirty([super.value = '']) : super.dirty();

  @override
  PrefectureValidationError? validator(String value) {
    return value.isEmpty ? PrefectureValidationError.invalid : null;
  }
}
