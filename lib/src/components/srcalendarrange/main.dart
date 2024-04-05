import 'package:flutter/material.dart';
import 'package:sunrise_ui/src/constants/srcolor/main.dart';

// ignore: non_constant_identifier_names
Future<dynamic> SRCalendarRange(
    {required BuildContext context,
    Function(DateTime newDateTime)? onCallBack,
    Function()? onComplete}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: Column(
                children: [
                  Container(
                    color: SRColor.baseGreyBg.withOpacity(.3),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 2,
                    margin: const EdgeInsets.only(top: 20, bottom: 2.5),
                  ),
                  Container(
                    color: SRColor.baseGreyBg.withOpacity(.3),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 2,
                    margin: const EdgeInsets.only(bottom: 5),
                  ),
                  // SizedBox(
                  //   height: 200,
                  //   child: CupertinoDatePicker(
                  //     mode: CupertinoDatePickerMode.date,
                  //     initialDateTime: DateTime.now(),
                  //     maximumYear: DateTime.now().year,
                  //     onDateTimeChanged: (DateTime newDateTime) {
                  //       // Do something
                  //       if (onCallBack != null) {
                  //         onCallBack(newDateTime);
                  //       }
                  //     },
                  //   ),
                  // )
                ],
              ),
            )
          ],
        );
      }).whenComplete(() => onComplete?.call());
}
