part of 'address_form_bloc.dart';

final class AddressFormState extends Equatable {
  const AddressFormState({
    this.country = const Country.pure(),
    this.prefecture = const Prefecture.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });

  final Country country;
  final Prefecture prefecture;
  final bool isValid;
  final FormzSubmissionStatus status;

  AddressFormState copyWith({
    Country? country,
    Prefecture? prefecture,
    bool? isValid,
    bool? buttonEnabled,
    FormzSubmissionStatus? status,
  }) {
    return AddressFormState(
      country: country ?? this.country,
      prefecture: prefecture ?? this.prefecture,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [country, prefecture, status];
}
