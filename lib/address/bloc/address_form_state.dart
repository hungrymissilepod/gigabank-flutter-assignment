part of 'address_form_bloc.dart';

final class AddressFormState extends Equatable {
  const AddressFormState({
    this.country = const Country.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });

  final Country country;
  final bool isValid;
  final FormzSubmissionStatus status;

  AddressFormState copyWith({
    Country? country,
    bool? isValid,
    bool? buttonEnabled,
    FormzSubmissionStatus? status,
  }) {
    return AddressFormState(
      country: country ?? this.country,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [country, status];
}
