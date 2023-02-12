import 'package:consultation_project/features/reservations/providers/reservation_provider.dart';
import 'package:consultation_project/main/settings/proivders/consultation_provider.dart';
import 'package:consultation_project/models/expert/expert_model.dart';
import 'package:consultation_project/models/times/free_time_of_expert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DayWidget extends StatefulWidget {
  FreeTimeOfExpertModel expertTimes;
  ExpertModel loadedExpert;

  DayWidget(
      {required this.expertTimes,
      required this.loadedExpert,
      });

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  Color chipColor = Colors.red;
  bool? isSelected;
  int? index;

  @override
  Widget build(BuildContext context) {
    // print(widget.loadedExpert.attributes.first_name);
    return Container(
      // constraints: BoxConstraints.loose(Size.zero),
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.all(15.sp),
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        children: [
          Text(
            widget.expertTimes.name,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Expanded(
            child: GridView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 50.h,
                    crossAxisCount: 2,
                    childAspectRatio: 0.9.sp,
                    mainAxisSpacing: 5.h,
                    crossAxisSpacing: 5.w),
                itemCount: widget.expertTimes.av_times.length,
                // itemCount: 5,
                itemBuilder: (context, i) {
                  List<String> stime =
                      widget.expertTimes.av_times[i].time_start.split(':');
                  String shour = stime[0];
                  String sminutes = stime[1];

                  List<String> etime =
                      widget.expertTimes.av_times[i].time_end.split(':');
                  String ehour = etime[0];
                  String eminutes = etime[1];

                  return ChoiceChip(
                    onSelected: (_) {
                      Provider.of<ReservationProvider>(context, listen: false)
                          .selectTime(widget.expertTimes.av_times[i].id, i);
                      setState(() {
                        widget.expertTimes.av_times[i].isSelected =
                            !widget.expertTimes.av_times[i].isSelected;
                      });
                      print(Provider.of<ReservationProvider>(context,
                              listen: false)
                          .selectedTime!
                          .toJson());
                    },
                    selectedColor: Colors.green,
                    backgroundColor:
                        (widget.expertTimes.av_times[i].isBooking == 0)
                            ? Colors.white
                            // Colors.green
                            : Theme.of(context).errorColor,
                    label: Text('$shour:$sminutes -> $ehour:$eminutes'),
                    selected: widget.expertTimes.av_times[i].isSelected,
                  );
                }),
          )
        ],
      ),
    );
  }
}
