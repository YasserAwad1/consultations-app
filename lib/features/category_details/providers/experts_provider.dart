import 'package:consultation_project/features/category_details/service/expert_service.dart';
import 'package:consultation_project/models/expert/expert_model.dart';
import 'package:flutter/material.dart';

class expertProvider with ChangeNotifier {
  ExpertService _service = ExpertService();
  List<ExpertModel> expertsOfCategory = [];

  getCategoryExperts(int catId) async {
    try {
      expertsOfCategory = await _service.getCategoryExperts(catId);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
