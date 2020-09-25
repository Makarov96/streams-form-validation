import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Joyspet/features/widgets/custom_input.dart';
import 'package:Joyspet/features/appointment/presentation/bloc/blocvalidation/validation_form_bloc.dart';

class PersonPhoneNumberInput extends StatelessWidget {
  const PersonPhoneNumberInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validatedFormBloc = BlocProvider.of<ValidateFormBloc>(context);
    return StreamBuilder<String>(
        stream: validatedFormBloc.personPhone,
        builder: (context, snapshot) {
          return Container(
            margin: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(80),
            ),
            child: CustomInputFormAppointment(
              textEditingController:
                  validatedFormBloc.textEditingControllerPhoneNumber,
              uniqueKey: 'person_phone',
              placeholder: 'Ingrasa tu número de telefono',
              keboardtype: TextInputType.phone,
              onChanged: validatedFormBloc.changePersonPhone,
              errorText: snapshot.error,
            ),
          );
        });
  }
}
