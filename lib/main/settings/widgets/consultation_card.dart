import 'package:consultation_project/main/home_page_view.dart';
import 'package:consultation_project/main/settings/proivders/consultation_provider.dart';
import 'package:consultation_project/models/consultations/personal_consultation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConsultationCard extends StatefulWidget {
  ConsultationModel consultation;
  int catId;
  int userId;
  ConsultationCard({
    required this.consultation,
    required this.catId,
    required this.userId,
  });

  @override
  State<ConsultationCard> createState() => _ConsultationCardState();
}

class _ConsultationCardState extends State<ConsultationCard> {
  @override
  Widget build(BuildContext context) {
    // print(widget.catId);
    // String catName =
    //     Provider.of<ConsultationCatProvider>(context, listen: false)
    //         .categoryName(catId);
    // print(catName);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.transparent,
      elevation: 7,
      shadowColor: Theme.of(context).colorScheme.secondary,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        width: 320.w,
        height: 190.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 10.h, left: 15.w, right: 15.w, bottom: 1.h),
              child: Row(
                children: [
                  Text(
                    widget.consultation.attributes.excerpt,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star_border,
                    color: Colors.amber,
                  ),
                  Text(widget.consultation.attributes.rate.toString())
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: Text(
                widget.consultation.relationships.type.name,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ),
            ///// description
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Text(
                widget.consultation.attributes.body,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.sp),
                softWrap: true,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                         Icon(
                          Icons.timer,
                          color: Colors.white,
                        ),
                        Text(
                          '30:00',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await Provider.of<ConsultationProvider>(context,
                            listen: false)
                        .deleteConsultation(
                      widget.consultation.id!,
                      widget.userId,
                    );
                    Navigator.of(context)
                        .pushReplacementNamed(HomePageView.routeName);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('deleted succesfully'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      '${widget.consultation.attributes.price.toString()} ${AppLocalizations.of(context)!.currency}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
