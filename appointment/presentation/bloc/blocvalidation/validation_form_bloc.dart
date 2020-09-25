import 'package:flutter/widgets.dart';

import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Joyspet/core/utils/date_formater.dart';
import 'package:Joyspet/features/appointment/domain/entities/appointment.dart';
import 'package:Joyspet/features/appointment/presentation/bloc/blocvalidation/validator.dart';

class ValidateFormBloc extends Bloc with Validator {
  ValidateFormBloc() : super(null);

  final TextEditingController textEditingControllerPhoneNumber =
      TextEditingController();
  final TextEditingController textEditingControllerPetName =
      TextEditingController();
  final TextEditingController textEditingControllerPetDetail =
      TextEditingController();

  //instances
  final _petName = BehaviorSubject<String>();
  final _personPhone = BehaviorSubject<String>();
  final _petDetails = BehaviorSubject<String>();
  final _appointmet = BehaviorSubject<Appointment>();
  final dateTimeStream = BehaviorSubject<DateTime>();
  final _totalAppointment = BehaviorSubject<num>();
  final _dateheadername = BehaviorSubject<num>();

  //Get
  Stream<String> get petName => _petName.stream.transform(validatePetName);
  Stream<String> get personPhone =>
      _personPhone.stream.transform(validatePersonPhone);
  Stream<DateTime> get datetime => dateTimeStream.stream;
  Stream<Appointment> get appointmet => _appointmet.stream;
  Stream<num> get totalappointment =>
      _totalAppointment.transform(validateTotalAppointment);
  Stream<num> get datetimehandleheadername => _dateheadername.stream;
  Stream<String> get petDetails =>
      _petDetails.stream.transform(validatePetDetails);
  Stream<bool> get appointmentValid => Rx.combineLatest4(
      petName,
      personPhone,
      petDetails,
      totalappointment,
      (petName, personPhone, petDetails, totalappointment) => true);

  //Set
  Function(String) get changePetName => _petName.sink.add;
  Function(String) get changePersonPhone => _personPhone.sink.add;
  Function(String) get changePetDetails => _petDetails.sink.add;
  Function(Appointment) get changeAppointment => _appointmet.sink.add;
  Function(DateTime) get changeDateTime => dateTimeStream.sink.add;
  Function(num) get changeTotalAppoinment => _totalAppointment.sink.add;
  Function(num) get changeHeaderName => _dateheadername.sink.add;

  void submitAppointment() {
    final formatted =
        CustomDateFormater().stringToDateValidForBackEnd(dateTimeStream.value);

    print(
      '${_petName.value} ${_personPhone.value}, ${_petDetails.value} ${_appointmet.value.price} ${formatted} ${_totalAppointment.value}',
    );
  }

  void drainStream() {
    textEditingControllerPetName.clear();
    textEditingControllerPhoneNumber.clear();
    textEditingControllerPetDetail.clear();

    _petName.value = textEditingControllerPetName.text;
    _personPhone.value = textEditingControllerPhoneNumber.text;
    _petDetails.value = textEditingControllerPetDetail.text;
  }

  @override
  Stream mapEventToState(event) {
    throw UnimplementedError();
  }

  void streamClose() {
    _petName?.close();
    _personPhone?.close();
    _petDetails?.close();
    _appointmet?.close();
  }
}
