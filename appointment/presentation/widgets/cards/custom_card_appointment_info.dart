import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Joyspet/core/uidetails/palettecolors.dart';
import 'package:Joyspet/features/widgets/custom_circle.dart';
import 'package:Joyspet/features/appointment/presentation/widgets/forms/form_appointment.dart';
import 'package:Joyspet/features/appointment/presentation/bloc/blocvalidation/validation_form_bloc.dart';

class CustomCardAppoinmentInfo extends StatelessWidget {
  const CustomCardAppoinmentInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var total = 10;
    final validatedFormBloc = BlocProvider.of<ValidateFormBloc>(context);
    validatedFormBloc.changeTotalAppoinment(total);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(150),
        horizontal: ScreenUtil().setWidth(80),
      ).copyWith(
        top: 1,
        bottom: ScreenUtil().setHeight(700),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CustomCircle(
              color: PaletteColor.customcolorlightpurple.withOpacity(0.3),
              marginRight: 220,
              marginTop: 100,
              circlHeight: 500,
              circleWidth: 500,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(40),
              top: ScreenUtil().setHeight(40),
            ),
            child: Text(
              'Cuéntanos más \nacerca de tu \nmascota',
              style: Theme.of(context).textTheme.headline2.copyWith(
                    fontSize: ScreenUtil().setSp(90),
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(250),
              ),
              child: Image.asset(
                'assets/images/appointment_dog_card.png',
                height: ScreenUtil().setHeight(600),
                width: ScreenUtil().setWidth(600),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              width: ScreenUtil().setWidth(150),
              height: ScreenUtil().setHeight(150),
              child: StreamBuilder<num>(
                  stream: validatedFormBloc.totalappointment,
                  builder: (context, snapshot) {
                    validatedFormBloc.changeTotalAppoinment(total);
                    return Text(
                      '${total}',
                      style: textTheme.headline3.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: ScreenUtil().setSp(120),
                        color: Colors.white,
                      ),
                    );
                  }),
              decoration: BoxDecoration(
                color: (total > 5)
                    ? PaletteColor.customcolorlightgreenwarn.withOpacity(0.5)
                    : (total > 3)
                        ? PaletteColor.customcolorlightyellowwarn
                            .withOpacity(0.5)
                        : PaletteColor.customcolorlightredwarn.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          FormAppointment(),
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: const Offset(2, 3),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}
