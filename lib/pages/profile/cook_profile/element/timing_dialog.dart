import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mitabl_user/helper/app_config.dart' as config;
import 'package:mitabl_user/pages/profile/cook_profile/cubit/cook_profile_cubit.dart';

class TimingDialog extends StatelessWidget {
  TimingDialog({Key? key}) : super(key: key);

  DateTime? nowDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CookProfileCubit, CookProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(config.AppConfig(context).appWidth(5)))),
          child: Container(
            height: config.AppConfig(context).appHeight(70),
            width: config.AppConfig(context).appWidth(90),
            padding: EdgeInsets.only(
                left: config.AppConfig(context).appWidth(5),
                right: config.AppConfig(context).appWidth(5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: config.AppConfig(context).appHeight(8),
                ),
                Text(
                  'mikitchn Timing',
                  style: GoogleFonts.gothicA1(
                      fontSize: config.AppConfig(context).appWidth(6),
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: config.AppConfig(context).appHeight(2),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Day',
                        style: GoogleFonts.gothicA1(
                            color: Theme.of(context).primaryColor,
                            fontSize: config.AppConfig(context).appWidth(4),
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Time',
                        style: GoogleFonts.gothicA1(
                            color: Theme.of(context).primaryColor,
                            fontSize: config.AppConfig(context).appWidth(4),
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: config.AppConfig(context).appHeight(2),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: config.AppConfig(context).appHeight(50),
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            );
                          },
                          itemCount: state.daysTiming.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: FlutterSwitch(
                                    activeText:
                                        state.daysTiming[index].day.toString(),
                                    inactiveText:
                                        state.daysTiming[index].day.toString(),
                                    value: state.daysTiming[index].isOn!,
                                    valueFontSize:
                                        config.AppConfig(context).appWidth(4),
                                    width:
                                        config.AppConfig(context).appWidth(20),
                                    borderRadius: 30.0,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      context
                                          .read<CookProfileCubit>()
                                          .onSwitchChanged(
                                              index: index, switchValue: val);
                                    },
                                  ),
                                ),
                                // Spacer(),
                                SizedBox(
                                  width: config.AppConfig(context).appWidth(6),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              _showDialog(
                                                  CupertinoDatePicker(
                                                    initialDateTime: DateTime(
                                                        nowDate!.year,
                                                        nowDate!.month,
                                                        nowDate!.day,
                                                        09,
                                                        0,
                                                        0),
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .time,
                                                    use24hFormat: false,
                                                    onDateTimeChanged:
                                                        (DateTime newTime) {
                                                      context
                                                          .read<
                                                              CookProfileCubit>()
                                                          .onSwitchChanged(
                                                              index: index,
                                                              startTime: DateFormat(
                                                                      'hh:mm a')
                                                                  .format(DateTime
                                                                      .now()));
                                                    },
                                                  ),
                                                  context);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left:
                                                      config.AppConfig(context)
                                                          .appWidth(3),
                                                  right:
                                                      config.AppConfig(context)
                                                          .appWidth(3),
                                                  top: config.AppConfig(context)
                                                      .appWidth(1),
                                                  bottom:
                                                      config.AppConfig(context)
                                                          .appWidth(1)),
                                              decoration: BoxDecoration(
                                                  color: Color(0xffF5F5F5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Text(
                                                state.daysTiming[index].timing!
                                                    .startTime!,
                                                // '9:00',
                                                style: GoogleFonts.gothicA1(
                                                    color: Theme.of(context)
                                                        .primaryColorDark,
                                                    fontSize: config.AppConfig(
                                                            context)
                                                        .appWidth(4)),
                                              ),
                                            )),
                                        SizedBox(
                                          width: config.AppConfig(context).appWidth(1),
                                        ),
                                        Text(
                                          'To',
                                          style: GoogleFonts.gothicA1(
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                              fontSize:
                                                  config.AppConfig(context)
                                                      .appWidth(4)),
                                        ),
                                        SizedBox(
                                          width: config.AppConfig(context).appWidth(1),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              _showDialog(
                                                  CupertinoDatePicker(
                                                    initialDateTime: DateTime(
                                                        nowDate!.year,
                                                        nowDate!.month,
                                                        nowDate!.day,
                                                        09,
                                                        0,
                                                        0),
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .time,
                                                    use24hFormat: false,
                                                    onDateTimeChanged:
                                                        (DateTime newTime) {
                                                      context
                                                          .read<
                                                              CookProfileCubit>()
                                                          .onSwitchChanged(
                                                              index: index,
                                                              endTime: DateFormat(
                                                                      'hh:mm a')
                                                                  .format(DateTime
                                                                      .now()));
                                                    },
                                                  ),
                                                  context);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left:
                                                      config.AppConfig(context)
                                                          .appWidth(3),
                                                  right:
                                                      config.AppConfig(context)
                                                          .appWidth(3),
                                                  top: config.AppConfig(context)
                                                      .appWidth(1),
                                                  bottom:
                                                      config.AppConfig(context)
                                                          .appWidth(1)),
                                              decoration: BoxDecoration(
                                                  color: Color(0xffF5F5F5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Text(
                                                state.daysTiming[index].timing!
                                                    .endTime!,
                                                style: GoogleFonts.gothicA1(
                                                    color: Theme.of(context)
                                                        .primaryColorDark,
                                                    fontSize: config.AppConfig(
                                                            context)
                                                        .appWidth(4)),
                                              ),
                                            )),
                                      ],
                                    ))
                              ],
                            );
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDialog(Widget child, BuildContext? context) {
    showCupertinoModalPopup<void>(
        context: context!,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }
}
