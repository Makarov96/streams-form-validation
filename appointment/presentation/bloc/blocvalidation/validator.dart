import 'dart:async';

class Validator {
  static final _phonenumberRegex = RegExp(r'^[0-9]{8}$');
  static final _petnameRegex = RegExp(r'^[-a-zA-ZÀ-ÖØ-öø-ÿ\s]+$');
  static final _petdetailRegex = RegExp(r'^[-a-zA-ZÀ-ÖØ-öø-ÿ\s]+$');

  final validateTotalAppointment = StreamTransformer<num, num>.fromHandlers(
    handleData: (totalappointment, sink) {
      if (totalappointment == 0) {
        sink.addError('Ya no hay mas citas disponibles');
      } else {
        sink.add(totalappointment);
      }
    },
  );

  final validatePetName = StreamTransformer<String, String>.fromHandlers(
      handleData: (petName, sink) => {
            //validation
            if (petName.isEmpty)
              {sink.addError('Campo vacio')}
            else if (!_petnameRegex.hasMatch(petName))
              {sink.addError('No se permite caracteres especiales')}
            else
              {sink.add(petName)}
          });

  final validatePersonPhone = StreamTransformer<String, String>.fromHandlers(
    handleData: (personPhone, sink) {
      if (personPhone.isEmpty) {
        sink.addError('Campo vacio');
      } else if (!_phonenumberRegex.hasMatch(personPhone)) {
        sink.addError('Numero de telefono no valido');
      } else {
        sink.add(personPhone);
      }
    },
  );

  final validatePetDetails = StreamTransformer<String, String>.fromHandlers(
    handleData: (petDetails, sink) {
      if (petDetails.isEmpty) {
        sink.addError('Campo vacio');
      }
      if (!_petdetailRegex.hasMatch(petDetails)) {
        sink.addError('Detalles no validos');
      } else {
        sink.add(petDetails);
      }
    },
  );
}
