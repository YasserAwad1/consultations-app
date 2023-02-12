import 'package:consultation_project/features/Expert_details/screens/expert_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubConsultationCard extends StatelessWidget {
  const SubConsultationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      elevation: 7,
      shadowColor: Theme.of(context).colorScheme.secondary,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(7.sp),
        iconColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'sub consultation title',
        ),
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, i) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ExpertDetailsScreen.routeName);
                  },
                  leading: Image.asset('assets/images/profile2.png'),
                  title: Text('expert name'),
                  subtitle: Text('Address'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.primary,
                    size: 18,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
