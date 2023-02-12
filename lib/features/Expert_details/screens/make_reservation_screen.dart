import 'package:consultation_project/auth/widgets/custom_button.dart';
import 'package:consultation_project/features/Expert_details/widgets/day_widget.dart';
import 'package:consultation_project/features/reservations/providers/reservation_provider.dart';
import 'package:consultation_project/main/settings/proivders/consultation_provider.dart';
import 'package:consultation_project/models/expert/expert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MakeReservationScreen extends StatefulWidget {
  static const routeName = '/make-reservation-screen';
  const MakeReservationScreen({super.key});

  @override
  State<MakeReservationScreen> createState() => _MakeReservationScreenState();
}

class _MakeReservationScreenState extends State<MakeReservationScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    ExpertModel loadedExpert = args["expert"];
    int consTypeId = args['consId'];

    Provider.of<ConsultationProvider>(context, listen: false)
        .getSingleExpertConsultation(
      loadedExpert.id!,
      consTypeId,
    );

    double price = Provider.of<ConsultationProvider>(context, listen: false)
        .expertConsultation!
        .attributes
        .price;

    print('*********price**********');
    print(price);

    print('*********price**********');

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.all(8.0.sp),
            child: CustomButton(
                text: 'confirm Reservation',
                onPressedFunction: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Confrim Reservation'),
                          content: Text(
                              'this consultation is going to cost $price SYP, do you wish to continue ? '),
                          actions: [
                            TextButton(
                              child: Text('yes'),
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await Provider.of<ReservationProvider>(context,
                                        listen: false)
                                    .makeReservation(
                                        loadedExpert.id!,
                                        consTypeId,
                                        Provider.of<ReservationProvider>(
                                                context,
                                                listen: false)
                                            .selectedTime!
                                            .id);
                                setState(() {
                                  isLoading = false;
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.green,
                                      content:
                                          Text('reservation made succesfully'),
                                    ),
                                  );
                                });
                              },
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('no'),
                            ),
                          ],
                        );
                      });
                },
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        appBar: AppBar(
          title: Text('Make Reservation'),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        body: FutureBuilder(
            future: Provider.of<ReservationProvider>(context, listen: false)
                .getExpertAvailableTimes(loadedExpert.id!),
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
                        return DayWidget(
                          expertTimes: expertTimes[i],
                          loadedExpert: loadedExpert,
                        );
                      }),
                );
              }
            }),
      ),
    );
  }
}
