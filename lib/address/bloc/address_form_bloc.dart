import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterassignment/models/apartment.dart';
import 'package:flutterassignment/models/models.dart';
import 'package:flutterassignment/models/municipality.dart';
import 'package:flutterassignment/models/prefecture.dart';
import 'package:flutterassignment/models/street_address.dart';
import 'package:formz/formz.dart';

part 'address_form_event.dart';
part 'address_form_state.dart';

class AddressFormBloc extends Bloc<AddressFormEvent, AddressFormState> {
  AddressFormBloc() : super(const AddressFormState()) {
    on<CountryChanged>(_onCountryChanged);
    on<PrefectureChanged>(_onPrefectureChanged);
    on<MunicipalityChanged>(_onMunicipalityChanged);
    on<StreetAddressChanged>(_onStreetAddressChanged);
    on<ApartmentChanged>(_onApartmentChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  Future<void> _onCountryChanged(
    CountryChanged event,
    Emitter<AddressFormState> emit,
  ) async {
    final Country country = Country.dirty(event.country);
    emit(state.copyWith(
      country: country.isValid ? country : Country.pure(event.country),
      isValid: Formz.validate([country, state.prefecture, state.municipality, state.streetAddress, state.apartment]),
    ));
  }

  Future<void> _onPrefectureChanged(
    PrefectureChanged event,
    Emitter<AddressFormState> emit,
  ) async {
    final Prefecture prefecture = Prefecture.dirty(event.prefecture);
    emit(state.copyWith(
      prefecture: prefecture.isValid ? prefecture : Prefecture.pure(event.prefecture),
      isValid: Formz.validate([state.country, prefecture, state.municipality, state.streetAddress, state.apartment]),
    ));
  }

  Future<void> _onMunicipalityChanged(
    MunicipalityChanged event,
    Emitter<AddressFormState> emit,
  ) async {
    final Municipality municipality = Municipality.dirty(event.municipality);
    emit(state.copyWith(
      municipality: municipality.isValid ? municipality : Municipality.pure(event.municipality),
      isValid: Formz.validate([state.country, state.prefecture, municipality, state.streetAddress, state.apartment]),
    ));
  }

  Future<void> _onStreetAddressChanged(
    StreetAddressChanged event,
    Emitter<AddressFormState> emit,
  ) async {
    final StreetAddress streetAddress = StreetAddress.dirty(event.streetAddress);
    emit(state.copyWith(
      streetAddress: streetAddress.isValid ? streetAddress : StreetAddress.pure(event.streetAddress),
      isValid: Formz.validate([state.country, state.prefecture, state.municipality, streetAddress, state.apartment]),
    ));
  }

  Future<void> _onApartmentChanged(
    ApartmentChanged event,
    Emitter<AddressFormState> emit,
  ) async {
    final Apartment apartment = Apartment.dirty(event.apartment);
    emit(state.copyWith(
      apartment: apartment.isValid ? apartment : Apartment.pure(event.apartment),
      isValid: Formz.validate([state.country, state.prefecture, state.municipality, apartment]),
    ));
  }

  Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<AddressFormState> emit,
  ) async {
    final Country country = Country.dirty(state.country.value);
    final Prefecture prefecture = Prefecture.dirty(state.prefecture.value);
    final Municipality municipality = Municipality.dirty(state.municipality.value);
    final StreetAddress streetAddress = StreetAddress.dirty(state.streetAddress.value);
    final Apartment apartment = Apartment.dirty(state.apartment.value);
    print('_onFormSubmitted: $country - $prefecture - $municipality - $streetAddress - $apartment');
    emit(
      state.copyWith(
        country: country,
        prefecture: prefecture,
        municipality: municipality,
        streetAddress: streetAddress,
        apartment: apartment,
        isValid: Formz.validate([country, prefecture, municipality, streetAddress, apartment]),
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
