import 'package:consultation_project/features/category_details/screens/category_experts_screen.dart';
import 'package:consultation_project/features/category_details/screens/sub_consltations_screen.dart';
import 'package:flutter/material.dart';

class ConsultationDetailsTabBarView extends StatelessWidget {
  static const routeName = '/consultation-details-tab-bar-view';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Consultation title'),
            ),
            bottom: TabBar(
              indicatorColor: Theme.of(context).colorScheme.primary,
              tabs: const [
                Tab(
                  text: 'Sub Consultations',
                ),
                Tab(
                  text: 'Experts',
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            SubConsultationsScreen(),
            CategoryExpertsScreen(),
          ]),
        ),
      ),
    );
  }
}
