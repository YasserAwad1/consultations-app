import 'dart:io';

import 'package:consultation_project/auth/widgets/custom_button.dart';
import 'package:consultation_project/common/constants/end_points.dart';
import 'package:consultation_project/features/category_details/widgets/search_bar.dart';
import 'package:consultation_project/features/reservations/providers/reservation_provider.dart';
import 'package:consultation_project/main/home/provider/consultation_cat_provider.dart';
import 'package:consultation_project/main/home/widgets/appointements_widget.dart';
import 'package:consultation_project/main/home/widgets/category_card_widget.dart';
import 'package:consultation_project/main/home/widgets/home_screen_header.dart';
import 'package:consultation_project/main/home/widgets/profile_balance_widget.dart';
import 'package:consultation_project/main/settings/proivders/consultation_provider.dart';
import 'package:consultation_project/main/settings/proivders/user_provider.dart';
import 'package:consultation_project/models/auth/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  PageController? controller;
  HomeScreen({this.controller});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _userFuture;
  var _categoryFuture;
  bool isInit = true;

  @override
  void initState() {
    _userFuture =
        Provider.of<UserProvider>(context, listen: false).getCurrentUser();
    _categoryFuture =
        Provider.of<ConsultationCatProvider>(context, listen: false)
            .getConsultationCategories();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   if (isInit) {}
  //   isInit = false;
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  List<String> imageList = [
    'family.png',
    'phsycological.jpg',
    'medical.jpg',
    'vocational.jpg',
    'business.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreenHeader(),
              SizedBox(
                height: 10.h,
              ),
              // PROFILE AND BALANCE CONTAINER
              // CustomButton(
              //     text: 'test',
              //     onPressedFunction: () async {
              //       await Provider.of<ReservationProvider>(context,
              //               listen: false)
              //           .getExpertAvailableTimes(20);
              //     },
              //     color: Colors.black),
              FutureBuilder(
                  future: _userFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      var currentUser =
                          Provider.of<UserProvider>(context).currentUser!;
                      return Column(
                        children: [
                          ProfileBalanceWidget(
                            controller: widget.controller!,
                            user: currentUser,
                            wallet: currentUser.wallet!,
                          ),
                        ],
                      );
                    }
                  }),
              SizedBox(
                height: 10.h,
              ),
              // SEARCH BAR //
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SearchBar(onChanged: null),
              ),
              SizedBox(
                height: 10.h,
              ),
              // APPOINTEMENTS AND VIEW ALL
              AppointementsWidget(),
              SizedBox(
                height: 10.h,
              ),
              FutureBuilder(
                  future: _categoryFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    var categoryList =
                        Provider.of<ConsultationCatProvider>(context)
                            .categories;
                    return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: categoryList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2.sp,
                        ),
                        itemBuilder: (context, i) {
                          return CategoryWidget(
                            category: categoryList[i],
                            image: imageList[i],
                          );
                        });
                  }),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
