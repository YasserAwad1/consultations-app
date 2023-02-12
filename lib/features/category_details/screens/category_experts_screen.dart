import 'package:consultation_project/features/category_details/providers/experts_provider.dart';
import 'package:consultation_project/main/home/provider/consultation_cat_provider.dart';
import 'package:consultation_project/models/category/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:consultation_project/features/category_details/widgets/expert_card.dart';
import 'package:consultation_project/features/category_details/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class CategoryExpertsScreen extends StatefulWidget {
  static const routeName = '/consultation-details-screen';

  @override
  State<CategoryExpertsScreen> createState() => _CategoryExpertsScreenState();
}

class _CategoryExpertsScreenState extends State<CategoryExpertsScreen> {
  CategoryModel? loadedCategory;
  var _expertsFuture;
  bool isInit = true;

  // @override
  // void didChangeDependencies() {
  //   if (isInit) {
  //     isInit = false;
  //   }

  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    loadedCategory =
        Provider.of<ConsultationCatProvider>(context, listen: false)
            .getConsultationCategoryById(
      args['id'],
    );

    _expertsFuture = Provider.of<expertProvider>(context, listen: false)
        .getCategoryExperts(loadedCategory!.id!);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Text(
                    loadedCategory!.attributes['name'],
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SearchBar(
              onChanged: null,
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                    future: _expertsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var experts = Provider.of<expertProvider>(context)
                            .expertsOfCategory;
                        if (experts.isEmpty) {
                          return Center(
                            child: Text('no experts in this category!'),
                          );
                        } else {
                          return GridView.builder(
                              shrinkWrap: true,
                              itemCount: experts.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.80.sp,
                                      crossAxisSpacing: 10.w,
                                      mainAxisSpacing: 10.h),
                              itemBuilder: (context, i) {
                                return ExpertCard(
                                  expert: experts[i],
                                  categoryId: loadedCategory!.id!,
                                );
                              });
                        }
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
