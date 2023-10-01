part of 'address_form_bloc.dart';

sealed class AddressFormEvent extends Equatable {
  const AddressFormEvent();

  @override
  List<Object> get props => [];
}

final class CountryChanged extends AddressFormEvent {
  const CountryChanged({required this.country});

  final String country;

  @override
  List<Object> get props => [country];
}

final class PrefectureChanged extends AddressFormEvent {
  const PrefectureChanged({required this.prefecture});

  final String prefecture;

  @override
  List<Object> get props => [prefecture];
}

final class FormSubmitted extends AddressFormEvent {}
