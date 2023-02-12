import 'package:consultation_project/features/reservations/providers/reservation_provider.dart';
import 'package:consultation_project/models/expert/expert_model.dart';
import 'package:consultation_project/models/times/free_time_of_expert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PersonalTimesWidget extends StatefulWidget {
  FreeTimeOfExpertModel expertTimes;
  PersonalTimesWidget({
    required this.expertTimes,
  });

  @override
  State<PersonalTimesWidget> createState() => _PersonalTimesWidgetState();
}

class _PersonalTimesWidgetState extends State<PersonalTimesWidget> {
  @override
  Widget build(BuildContext context) {
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

                  return Chip(
                    backgroundColor:
                        (widget.expertTimes.av_times[i].isBooking == 0)
                            ? Colors.white
                            : Theme.of(context).errorColor,
                    label: Text('${shour}:${sminutes} -> ${ehour}:${eminutes}'),
                  );
                }),
          )
        ],
      ),
    );
  }
}
