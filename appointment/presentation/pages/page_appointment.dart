import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Joyspet/features/appointment/presentation/widgets/layout/layout.dart';
import 'package:Joyspet/features/appointment/presentation/bloc/blocvalidation/validation_form_bloc.dart';

class PageAppointment extends StatelessWidget {
  const PageAppointment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ValidateFormBloc(),
        )
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: true,
        body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: PageAppointmentLayout()),
      ),
    );
  }
}
