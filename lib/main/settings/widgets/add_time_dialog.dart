import 'package:consultation_project/features/reservations/providers/reservation_provider.dart';
import 'package:consultation_project/models/times/day_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddTimeDialogWidget extends StatefulWidget {
  const AddTimeDialogWidget({super.key});

  @override
  State<AddTimeDialogWidget> createState() => _AddTimeDialogWidgetState();
}

class _AddTimeDialogWidgetState extends State<AddTimeDialogWidget> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  void _selectStartTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    if (newTime != null) {
      setState(() {
        startTime = newTime;
      });
    }
  }

  void _selectEndTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: endTime,
    );
    if (newTime != null) {
      setState(() {
        endTime = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await Provider.of<ReservationProvider>(context, listen: false)
                .createWorkTime(
                    Provider.of<ReservationProvider>(context, listen: false).selectedDay!.id,
                    startTime.format(context),
                    endTime.format(context));
            Navigator.of(context).pop();
          },
          child: Text('add time'),
        )
      ],
      content: Container(
        height: 150.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Day:'),
                FutureBuilder(
                    future:
                        Provider.of<ReservationProvider>(context, listen: false)
                            .getAllDays(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary,
                        );
                      } else {
                        var days =
                            Provider.of<ReservationProvider>(context).allDays;
                        String chosenDay =
                            Provider.of<ReservationProvider>(context)
                                        .selectedDay ==
                                    null
                                ? 'choose'
                                : Provider.of<ReservationProvider>(context)
                                    .selectedDay!
                                    .name;
                        return DropdownButton(
                          dropdownColor:
                              Theme.of(context).colorScheme.secondary,
                          items: days.map((day) {
                            return DropdownMenuItem<int>(
                              value: day.id,
                              child: Text(day.name),
                            );
                          }).toList(),
                          onChanged: (ss) {
                            Provider.of<ReservationProvider>(context,
                                    listen: false)
                                .selectDay(ss!);
                          },
                          hint: Text(
                            chosenDay,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('from:'),
                // startTime != null
                //     ?
                Text(startTime.format(context)),
                // : Text('not selected'),
                IconButton(
                    onPressed: () {
                      _selectStartTime();
                    },
                    icon: Icon(
                      Icons.timer,
                      color: Theme.of(context).colorScheme.secondary,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('to:'),
                Text(endTime.format(context)),
                IconButton(
                    onPressed: () {
                      _selectEndTime();
                    },
                    icon: Icon(
                      Icons.timer,
                      color: Theme.of(context).colorScheme.secondary,
                    ))
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
