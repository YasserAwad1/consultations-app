import 'package:consultation_project/auth/providers/auth_provider.dart';
import 'package:consultation_project/auth/screens/welcome_screen.dart';
import 'package:consultation_project/auth/widgets/custom_button.dart';
import 'package:consultation_project/auth/widgets/custom_textfrom_field.dart';
import 'package:consultation_project/common/constants/end_points.dart';
import 'package:consultation_project/common/local/local_repo.dart';
import 'package:consultation_project/common/widgets/row_divider.dart';
import 'package:consultation_project/common/widgets/side_container.dart';
import 'package:consultation_project/features/reservations/providers/reservation_provider.dart';
import 'package:consultation_project/l10n/l10n.dart';
import 'package:consultation_project/locator.dart';
import 'package:consultation_project/main/settings/proivders/consultation_provider.dart';
import 'package:consultation_project/main/settings/proivders/user_provider.dart';
import 'package:consultation_project/main/settings/screens/times_screen.dart';
import 'package:consultation_project/main/settings/widgets/add_consultation_widget.dart';
import 'package:consultation_project/main/settings/widgets/add_time_dialog.dart';
import 'package:consultation_project/main/settings/widgets/consultation_card.dart';
import 'package:consultation_project/main/settings/widgets/language_widget.dart';
import 'package:consultation_project/models/auth/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  UserModel? currentUser;
  bool? isExpert;
  bool isButtonPressed = false;

  // var _daysFuture;
  // var _consultationFuture;

  @override
  void initState() {
    currentUser = Provider.of<UserProvider>(context, listen: false).currentUser;
    isExpert = currentUser!.role_id == 2;
    setState(() {
      isButtonPressed = false;
    });

    // _daysFuture = Provider.of(context)

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _consultationFuture =

    return SafeArea(
      child: Scaffold(
        floatingActionButton: isExpert!
            ? FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddTimeDialogWidget();
                      });
                })
            : null,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SideContainer(title: 'Profile'),
                  if (isExpert!)
                    Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20)),
                        height: 60,
                        width: 150,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              TimesScreen.routeName,
                            );
                          },
                          child: Text(
                            'View Times',
                            style:
                                TextStyle(fontSize: 17.sp, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: currentUser!.image != null
                        ? Image(
                            image: NetworkImage(
                              '${Endpoints.baseUrl}${currentUser!.image}',
                            ),
                          )
                        : Image.asset('assets/images/person.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Column(
                  children: [
                    RowDivider(
                        title: 'Name',
                        subtitle:
                            '${currentUser!.first_name} ${currentUser!.last_name}'),
                    SizedBox(
                      height: 10.h,
                    ),
                    if (currentUser!.address != null)
                      RowDivider(
                          title: 'Address',
                          subtitle: '${currentUser!.address}'),
                    if (currentUser!.address != null)
                      SizedBox(
                        height: 10.h,
                      ),
                    if (currentUser!.phone != null)
                      RowDivider(
                          title: 'Phone Number',
                          subtitle: '${currentUser!.phone}'),
                    SizedBox(
                      height: 15.h,
                    ),
                    if (isExpert! && !isButtonPressed)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: FloatingActionButton.extended(
                            elevation: 13,
                            onPressed: () {
                              setState(() {
                                isButtonPressed = true;
                              });
                            },
                            label: Text(
                              'Add Consultation',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    /////////////////add consultation widget////////////////////
                    if (isButtonPressed) AddConsultationWidget(),
                    SizedBox(
                      height: 10.h,
                    ),
                    if (isExpert!)
                      FutureBuilder(
                        future: Provider.of<ConsultationProvider>(context,
                                listen: false)
                            .getExpertConsultaions(
                          currentUser!.id!,
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            var consultations =
                                Provider.of<ConsultationProvider>(context)
                                    .personalConsultations;
                            print(consultations.length);
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: consultations.length,
                              itemBuilder: (context, i) {
                                return ConsultationCard(
                                  catId: consultations[i].id!,
                                  consultation: consultations[i],
                                  userId: currentUser!.id!,
                                );
                              },
                            );
                          }
                        },
                      ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              SideContainer(title: AppLocalizations.of(context)!.application),
              LanguageWidget(),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: CustomButton(
                  text: AppLocalizations.of(context)!.logout,
                  onPressedFunction: () async {
                    final loggedOut =
                        await Provider.of<AuthProvider>(context, listen: false)
                            .logOut();
                    if (loggedOut) {
                      Provider.of<ConsultationProvider>(context, listen: false)
                          .personalConsultations
                          .clear();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          WelcomeScreen.routeName, (route) => false);
                    }
                  },
                  color: Theme.of(context).errorColor,
                ),
              ),
              SizedBox(
                height: 15.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
