import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterassignment/models/models.dart';
import 'package:flutterassignment/models/municipality.dart';
import 'package:flutterassignment/models/prefecture.dart';
import 'package:formz/formz.dart';

part 'address_form_event.dart';
part 'address_form_state.dart';

class AddressFormBloc extends Bloc<AddressFormEvent, AddressFormState> {
  AddressFormBloc() : super(const AddressFormState()) {
    on<CountryChanged>(_onCountryChanged);
    on<PrefectureChanged>(_onPrefectureChanged);
    on<MunicipalityChanged>(_onMunicipalityChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  Future<void> _onCountryChanged(
    CountryChanged event,
    Emitter<AddressFormState> emit,
  ) async {
    final Country country = Country.dirty(event.country);
    emit(state.copyWith(
      country: country.isValid ? country : Country.pure(event.country),
      isValid: Formz.validate([country]),
    ));
  }

  Future<void> _onPrefectureChanged(
    PrefectureChanged event,
    Emitter<AddressFormState> emit,
  ) async {
    final Prefecture prefecture = Prefecture.dirty(event.prefecture);
    emit(state.copyWith(
      prefecture: prefecture.isValid ? prefecture : Prefecture.pure(event.prefecture),
      isValid: Formz.validate([prefecture]),
    ));
  }

  Future<void> _onMunicipalityChanged(
    MunicipalityChanged event,
    Emitter<AddressFormState> emit,
  ) async {
    final Municipality municipality = Municipality.dirty(event.municipality);
    emit(state.copyWith(
      municipality: municipality.isValid ? municipality : Municipality.pure(event.municipality),
      isValid: Formz.validate([municipality]),
    ));
  }

  Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<AddressFormState> emit,
  ) async {
    final Country country = Country.dirty(state.country.value);
    final Prefecture prefecture = Prefecture.dirty(state.prefecture.value);
    final Municipality municipality = Municipality.dirty(state.municipality.value);
    print('_onFormSubmitted: $country - $prefecture - $municipality');
    emit(
      state.copyWith(
        country: country,
        prefecture: prefecture,
        municipality: municipality,
        isValid: Formz.validate([country, prefecture, municipality]),
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    }
  }
}
