import 'package:consultation_project/main/home/provider/consultation_cat_provider.dart';
import 'package:consultation_project/main/home_page_view.dart';
import 'package:consultation_project/main/settings/proivders/consultation_provider.dart';
import 'package:consultation_project/models/category/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:consultation_project/auth/widgets/custom_textfrom_field.dart';
import 'package:provider/provider.dart';

class AddConsultationWidget extends StatefulWidget {
  // AddConsultationWidget({required this.isButtonPressed});

  @override
  State<AddConsultationWidget> createState() => _AddConsultationWidgetState();
}

class _AddConsultationWidgetState extends State<AddConsultationWidget> {
  var _categoryFuture;

  bool isLoading = false;

  final TextEditingController detailsController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    _categoryFuture =
        Provider.of<ConsultationCatProvider>(context, listen: false)
            .getConsultationCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String chosenConsultation =
        Provider.of<ConsultationCatProvider>(context).selectedCategroy == null
            ? 'choose'
            : Provider.of<ConsultationCatProvider>(context)
                .selectedCategroy!
                .attributes['name'];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Type',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              FutureBuilder(
                  future: _categoryFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.secondary,
                      );
                    } else {
                      var categories =
                          Provider.of<ConsultationCatProvider>(context)
                              .categories;
                      return DropdownButton(
                        dropdownColor: Theme.of(context).colorScheme.secondary,
                        items: categories.map((category) {
                          return DropdownMenuItem<int>(
                            value: category.id,
                            child: Text(category.attributes['name']),
                          );
                        }).toList(),
                        onChanged: (ss) {
                          Provider.of<ConsultationCatProvider>(context,
                                  listen: false)
                              .selectCategory(ss!);
                          print(Provider.of<ConsultationCatProvider>(context,
                                  listen: false)
                              .selectedCategroy!
                              .id);
                        },
                        hint: Text(
                          chosenConsultation,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
        CustomTextFormField(
          icon: Icon(
            Icons.align_vertical_center_outlined,
            color: Theme.of(context).colorScheme.secondary,
          ),
          label: 'Title',
          color: Theme.of(context).colorScheme.secondary,
          controller: titleController,
        ),
        CustomTextFormField(
          textInputType: TextInputType.number,
          icon: Icon(
            Icons.money,
            color: Theme.of(context).colorScheme.secondary,
          ),
          label: 'Price',
          color: Theme.of(context).colorScheme.secondary,
          controller: priceController,
        ),
        CustomTextFormField(
          controller: detailsController,
          isTextLong: true,
          icon: Icon(
            Icons.more_horiz_outlined,
            color: Theme.of(context).colorScheme.secondary,
          ),
          label: 'Details',
          color: Theme.of(context).colorScheme.secondary,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : FloatingActionButton.extended(
                    elevation: 13,
                    onPressed: () async {
                      if (Provider.of<ConsultationCatProvider>(context,
                                  listen: false)
                              .selectedCategroy!
                              .id !=
                          null) {
                        setState(() {
                          isLoading = true;
                        });
                        await Provider.of<ConsultationProvider>(context,
                                listen: false)
                            .addConsultation(
                          titleController.text,
                          detailsController.text,
                          double.parse(priceController.text),
                          Provider.of<ConsultationCatProvider>(context,
                                  listen: false)
                              .selectedCategroy!
                              .id!,
                        );
                        setState(() {
                          Navigator.of(context)
                              .pushReplacementNamed(HomePageView.routeName);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Added succesfully'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          titleController.clear();
                          detailsController.clear();
                          priceController.clear();
                          Provider.of<ConsultationCatProvider>(context,
                                  listen: false)
                              .selectedCategroy = null;
                          isLoading = false;
                        });
                      }
                    },
                    label: Text(
                      'Add Consultation',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    icon: const Icon(Icons.add),
                  ),
          ),
        ),
      ],
    );
  }
}
