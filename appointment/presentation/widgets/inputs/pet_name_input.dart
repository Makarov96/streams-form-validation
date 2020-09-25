import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Joyspet/features/widgets/custom_input.dart';
import 'package:Joyspet/features/appointment/presentation/bloc/blocvalidation/validation_form_bloc.dart';

class PetNameInput extends StatelessWidget {
  const PetNameInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validatedFormBloc = BlocProvider.of<ValidateFormBloc>(context);
    return Container(
      margin: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(50),
      ),
      child: StreamBuilder<String>(
        stream: validatedFormBloc.petName,
        builder: (context, snapshot) {
          return CustomInputFormAppointment(
            textEditingController:
                validatedFormBloc.textEditingControllerPetName,
            uniqueKey: 'pet_name',
            placeholder: 'Ingresa el nombre de tu mascota',
            keboardtype: TextInputType.text,
            onChanged: validatedFormBloc.changePetName,
            errorText: snapshot.error,
          );
        },
      ),
    );
  }
}
