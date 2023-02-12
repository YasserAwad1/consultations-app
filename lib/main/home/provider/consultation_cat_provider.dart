import 'package:consultation_project/main/home/service/consultation_cat_service.dart';
import 'package:consultation_project/models/category/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConsultationCatProvider with ChangeNotifier {
  ConsultationCatService _catService = ConsultationCatService();
  List<CategoryModel> categories = [];
  CategoryModel? selectedCategroy;

  void selectCategory(int id) {
    selectedCategroy = categories.singleWhere((element) => element.id == id);
    notifyListeners();
  }

  String categoryName(int catId) {
    return categories
        .firstWhere((element) => element.id == catId)
        .attributes['name'];
  }

  getConsultationCategories() async {
    try {
      categories = await _catService.getAllConsultationCategories();
    } catch (e) {
      print(e);
    }
  }

  getConsultationCategoryById(int id) {
    return categories.firstWhere((category) => category.id == id);
  }
}
