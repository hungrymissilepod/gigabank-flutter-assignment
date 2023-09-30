import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterassignment/models/models.dart';
import 'package:formz/formz.dart';

part 'address_form_event.dart';
part 'address_form_state.dart';

class AddressFormBloc extends Bloc<AddressFormEvent, AddressFormState> {
  AddressFormBloc() : super(const AddressFormState()) {
    on<CountryChanged>(_onCountryChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  Future<void> _onCountryChanged(
    CountryChanged event,
    Emitter<AddressFormState> emit,
  ) async {
    final country = Country.dirty(event.country);
    emit(state.copyWith(
      country: country.isValid ? country : Country.pure(event.country),
      isValid: Formz.validate([country]),
    ));
  }

  Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<AddressFormState> emit,
  ) async {
    final country = Country.dirty(state.country.value);
    print('_onFormSubmitted: $country');
    emit(
      state.copyWith(
        country: country,
        isValid: Formz.validate([country]),
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    }
  }
}
