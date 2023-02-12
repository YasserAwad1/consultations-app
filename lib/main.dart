import 'package:consultation_project/auth/providers/auth_provider.dart';
import 'package:consultation_project/auth/screens/expert_signup_details_screen.dart';
import 'package:consultation_project/auth/screens/signup_page_view.dart';
import 'package:consultation_project/features/Expert_details/screens/expert_details_screen.dart';
import 'package:consultation_project/features/Expert_details/screens/make_reservation_screen.dart';
import 'package:consultation_project/features/category_details/providers/experts_provider.dart';
import 'package:consultation_project/features/category_details/screens/consultation_details_tab_bar_view.dart';
import 'package:consultation_project/features/category_details/screens/category_experts_screen.dart';
import 'package:consultation_project/features/reservations/providers/reservation_provider.dart';
import 'package:consultation_project/l10n/l10n.dart';
import 'package:consultation_project/locator.dart';
import 'package:consultation_project/main/favorites/providers/favorites_provider.dart';
import 'package:consultation_project/main/home/provider/language_provider.dart';
import 'package:consultation_project/main/home_page_view.dart';
import 'package:consultation_project/main/home/provider/consultation_cat_provider.dart';
import 'package:consultation_project/main/settings/proivders/consultation_provider.dart';
import 'package:consultation_project/main/settings/proivders/user_provider.dart';
import 'package:consultation_project/main/settings/screens/times_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:consultation_project/auth/screens/login_screen.dart';
import 'package:consultation_project/auth/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'auth/screens/welcome_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ((context, child) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (ctx) => AuthProvider(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => UserProvider(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => ConsultationCatProvider(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => ConsultationProvider(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => expertProvider(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => ReservationProvider(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => FavoriteProvider(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => LanguageProvider(),
              ),
            ],
            child: Builder(
              builder: (context) {
                return MaterialApp(
                  locale: Provider.of<LanguageProvider>(context, listen: true)
                    .currentLocale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSwatch().copyWith(
                      primary: Colors.purple[900],
                      secondary: Colors.indigo,
                    ),
                  ),
                  home: WelcomeScreen(),
                  routes: {
                    WelcomeScreen.routeName: (context) => WelcomeScreen(),
                    LoginScreen.routeName: (context) => LoginScreen(),
                    SignUpScreen.routeName: (context) => SignUpScreen(),
                    SignUpPageView.routeName: (context) => SignUpPageView(),
                    ExpertSignUpDetailsScreen.routeName: (context) =>
                        ExpertSignUpDetailsScreen(),
                    CategoryExpertsScreen.routeName: (context) =>
                        CategoryExpertsScreen(),
                    ExpertDetailsScreen.routeName: (context) =>
                        ExpertDetailsScreen(),
                    ConsultationDetailsTabBarView.routeName: (context) =>
                        ConsultationDetailsTabBarView(),
                    HomePageView.routeName: (context) => HomePageView(),
                    TimesScreen.routeName: (context) => TimesScreen(),
                    MakeReservationScreen.routeName: (context) =>
                        MakeReservationScreen()
                  },
                );
              }
            ),
          )),
    );
  }
}
