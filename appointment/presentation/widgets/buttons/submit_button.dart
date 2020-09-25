import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Joyspet/features/appointment/presentation/bloc/blocvalidation/validation_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validatedFormBloc = BlocProvider.of<ValidateFormBloc>(context);
    final theme = Theme.of(context);
    return StreamBuilder<bool>(
        stream: validatedFormBloc.appointmentValid,
        builder: (context, snapshot) {
          return Container(
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(30.0),
            ),
            child: ButtonTheme(
              minWidth: ScreenUtil().setWidth(800),
              height: ScreenUtil().setHeight(120),
              child: RaisedButton(
                color: theme.canvasColor,
                onPressed: !snapshot.hasData
                    ? null
                    : () {
                        validatedFormBloc.submitAppointment();
                        validatedFormBloc.drainStream();
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                      },
                child: Text(
                  'Reservar',
                  style: theme.textTheme.headline4.copyWith(
                    fontSize: ScreenUtil().setSp(55),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          );
        });
  }
}
