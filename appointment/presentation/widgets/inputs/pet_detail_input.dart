import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Joyspet/features/appointment/presentation/bloc/blocvalidation/validation_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetDetailInput extends StatelessWidget {
  const PetDetailInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validatedFormBloc = BlocProvider.of<ValidateFormBloc>(context);
    return StreamBuilder<String>(
        stream: validatedFormBloc.petDetails,
        builder: (context, snapshot) {
          return Container(
            height: ScreenUtil().setHeight(
              400,
            ),
            child: TextFormField(
              key: Key('pet_detail'),
              controller: validatedFormBloc.textEditingControllerPetDetail,
              textAlignVertical: TextAlignVertical.top,
              expands: true,
              maxLines: null,
              maxLength: 150,
              decoration: InputDecoration(
                errorText: snapshot.error,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                hintText: '¿Tu mascota es alérgica a algo?',
              ),
              onChanged: validatedFormBloc.changePetDetails,
            ),
          );
        });
  }
}
