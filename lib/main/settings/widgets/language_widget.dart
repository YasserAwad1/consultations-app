import 'package:consultation_project/main/home/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          // LANGUAGE
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 4.w,
              ),
              Icon(
                Icons.language_rounded,
                color: Theme.of(context).colorScheme.secondary,
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Provider.of<LanguageProvider>(context, listen: false)
                      .changeLocale('en');
                },
                style: TextButton.styleFrom(
                  // backgroundColor: isArabic
                  //     ? Theme.of(context).colorScheme.primary
                  //     : Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 3.w,
                      color:
                          // isArabic
                          // ?
                          Theme.of(context).colorScheme.primary,
                      // : Theme.of(context).colorScheme.secondary,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.english,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Provider.of<LanguageProvider>(context, listen: false)
                      .changeLocale('ar');
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 3.w,
                      color:
                          // isArabic
                          // ?
                          Theme.of(context).colorScheme.secondary,
                      // : Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(AppLocalizations.of(context)!.arabic,
                    style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
