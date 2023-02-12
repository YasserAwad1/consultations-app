import 'package:consultation_project/auth/widgets/custom_button.dart';
import 'package:consultation_project/common/constants/end_points.dart';
import 'package:consultation_project/common/widgets/row_divider.dart';
import 'package:consultation_project/features/Expert_details/screens/make_reservation_screen.dart';
import 'package:consultation_project/features/Expert_details/widgets/custom_small_Button.dart';
import 'package:consultation_project/features/Expert_details/widgets/day_widget.dart';
import 'package:consultation_project/features/reservations/providers/reservation_provider.dart';
import 'package:consultation_project/main/settings/proivders/consultation_provider.dart';
import 'package:consultation_project/models/consultations/personal_consultation_model.dart';
import 'package:consultation_project/models/expert/expert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ExpertDetailsScreen extends StatefulWidget {
  static const routeName = '/expert-details-screen';

  @override
  State<ExpertDetailsScreen> createState() => _ExpertDetailsScreenState();
}

class _ExpertDetailsScreenState extends State<ExpertDetailsScreen> {
  late ExpertModel loadedExpert;
  ConsultationModel? thisConsultaion;

  @override
  void initState() {
    // Provider.of<ConsultationProvider>(context, listen: false)
    //     .getSingleExpertConsultation(
    //   loadedExpert.id!,
    //   categoryId,
    // );

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    loadedExpert = args['expert'];
    int categoryId = args['catId'];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: CustomButton(
              text: 'Reserve Appointement',
              onPressedFunction: () {
                Navigator.of(context)
                    .pushNamed(MakeReservationScreen.routeName, arguments: {
                  "expert": loadedExpert,
                  "consId":
                      thisConsultaion!.id
                });
              },
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        body: FutureBuilder(
            future: Provider.of<ConsultationProvider>(context, listen: false)
                .getSingleExpertConsultation(
              loadedExpert.id!,
              categoryId,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              ConsultationModel? currentConsultation =
                  thisConsultaion = Provider.of<ConsultationProvider>(
                context,
              ).expertConsultation;
              return Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        color: Colors.white,
                        height: 240.h,
                        width: double.infinity,
                        child: loadedExpert.attributes.image != null
                            ? Image(
                                image: NetworkImage(
                                    '${Endpoints.baseUrl}${loadedExpert.attributes.image}'),
                              )
                            : Image.asset(
                                'assets/images/avatar2.jpg',
                                fit: BoxFit.cover,
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomSmallButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressedFunction: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            CustomSmallButton(
                              icon: Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                              onPressedFunction: () {},
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 200.h,
                        left: 30.w,
                        child: Card(
                          color: Colors.transparent,
                          elevation: 10,
                          shadowColor: Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                            height: 110.h,
                            width: 300.w,
                            padding: EdgeInsets.all(5.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(context).colorScheme.secondary,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: const [0.1, 0.7],
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '${loadedExpert.attributes.first_name} ${loadedExpert.attributes.last_name}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  currentConsultation!.attributes.body,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              RowDivider(
                                  title: 'Title',
                                  subtitle:
                                      '${currentConsultation.attributes.excerpt}'),
                              SizedBox(
                                height: 10.h,
                              ),
                              RowDivider(
                                  title: 'Address',
                                  subtitle:
                                      '${loadedExpert.attributes.address}'),
                              SizedBox(
                                height: 10.h,
                              ),
                              RowDivider(
                                  title: 'Phone Number',
                                  subtitle: '${loadedExpert.attributes.phone}'),
                              SizedBox(
                                height: 10.h,
                              ),
                              RowDivider(
                                  title: 'Consultation Type',
                                  subtitle: currentConsultation
                                      .relationships.type.name),
                              SizedBox(
                                height: 10.h,
                              ),
                              RowDivider(
                                  title: 'Price',
                                  subtitle:
                                      '${currentConsultation.attributes.price.toString()} SYP'),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                padding: EdgeInsets.all(15.h),
                                width: 300.w,
                                margin:
                                    EdgeInsets.only(left: 30.w, right: 30.w),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 30.sp,
                                      initialRating: 4,
                                      glow: false,
                                      ignoreGestures: true,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Text(
                                      loadedExpert.attributes.rate.toString(),
                                      style: TextStyle(fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
