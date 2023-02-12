import 'package:consultation_project/auth/widgets/custom_button.dart';
import 'package:consultation_project/features/Expert_details/widgets/day_widget.dart';
import 'package:consultation_project/features/reservations/providers/reservation_provider.dart';
import 'package:consultation_project/main/settings/proivders/user_provider.dart';
import 'package:consultation_project/main/settings/widgets/personal_times_widget.dart';
import 'package:consultation_project/models/expert/expert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TimesScreen extends StatefulWidget {
  static const routeName = '/times-screen';
  const TimesScreen({super.key});

  @override
  State<TimesScreen> createState() => _TimesScreenState();
}

class _TimesScreenState extends State<TimesScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Times'),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        body: FutureBuilder(
            future: Provider.of<ReservationProvider>(context, listen: false)
                .getExpertAvailableTimes(
                    Provider.of<UserProvider>(context, listen: false)
                        .currentUser!
                        .id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var expertTimes =
                    Provider.of<ReservationProvider>(context).expertFreeTimes;
                return SingleChildScrollView(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: expertTimes.length,
                      itemBuilder: (context, i) {
                        return PersonalTimesWidget(
                          expertTimes: expertTimes[i],
                        );
                      }),
                );
              }
            }),
      ),
    );
  }
}
