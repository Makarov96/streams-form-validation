import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Joyspet/features/appointment/presentation/widgets/inputs/inputs.dart';
import 'package:Joyspet/features/appointment/presentation/widgets/buttons/submit_button.dart';
import 'package:Joyspet/features/appointment/presentation/bloc/blocvalidation/validation_form_bloc.dart';

class FormAppointment extends StatefulWidget {
  const FormAppointment({Key key}) : super(key: key);

  @override
  _FormAppointmentState createState() => _FormAppointmentState();
}

class _FormAppointmentState extends State<FormAppointment> {
  @override
  void dispose() {
    var validatedFormBloc = BlocProvider.of<ValidateFormBloc>(context);
    validatedFormBloc.textEditingControllerPetDetail.dispose();
    validatedFormBloc.textEditingControllerPhoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(100),
      ).copyWith(
        top: ScreenUtil().setHeight(280),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PetNameInput(),
          PersonPhoneNumberInput(),
          PetDetailInput(),
          SubmitButton()
        ],
      ),
    );
  }
}
