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

final class MunicipalityChanged extends AddressFormEvent {
  const MunicipalityChanged({required this.municipality});

  final String municipality;

  @override
  List<Object> get props => [municipality];
}

final class StreetAddressChanged extends AddressFormEvent {
  const StreetAddressChanged({required this.streetAddress});

  final String streetAddress;

  @override
  List<Object> get props => [streetAddress];
}

final class ApartmentChanged extends AddressFormEvent {
  const ApartmentChanged({required this.apartment});

  final String apartment;

  @override
  List<Object> get props => [apartment];
}

final class FormSubmitted extends AddressFormEvent {}
