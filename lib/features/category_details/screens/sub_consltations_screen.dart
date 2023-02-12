import 'package:consultation_project/features/category_details/widgets/search_bar.dart';
import 'package:consultation_project/features/category_details/widgets/sub_consultation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubConsultationsScreen extends StatelessWidget {
  const SubConsultationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              SearchBar(onChanged: null),
              SizedBox(
                height: 15.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, i) {
                  return SubConsultationCard();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
