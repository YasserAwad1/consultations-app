import 'package:consultation_project/main/home/service/consultation_cat_service.dart';
import 'package:consultation_project/main/settings/sevices/consultation_service.dart';
import 'package:consultation_project/models/consultations/attributes_model.dart';
import 'package:consultation_project/models/consultations/personal_consultation_model.dart';
import 'package:flutter/material.dart';

class ConsultationProvider with ChangeNotifier {
  ConsultationService _service = ConsultationService();
  List<ConsultationModel> personalConsultations = [];
  ConsultationModel? expertConsultation;

  getExpertConsultaions(int userId) async {
    try {
      personalConsultations = await _service.getExpertConsultations(userId);
      notifyListeners();
      // print('********ppppppppppp******************');
      // print(personalConsultations);
      // print('********ppppppppppp******************');
    } catch (e) {
      print(e);
    }
  }

  getSingleExpertConsultation(int expertId, int catId) async {
    try {
      var tempConsultations =
          await _service.getExpertConsultations(expertId).then((value) => {
                expertConsultation = value.singleWhere((element) =>
                    (element.relationships.type.id == catId &&
                        element.relationships.user.id == expertId))
              });

      // var tempConsultations = await _service.getExpertConsultations(expertId).then((value) => value.singleWhere((element) {
      // expertConsultation = value.singleWhere(
      //   (element) => (element.relationships.type.id == catId &&
      //       element.relationships.user.id == expertId),

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  addConsultation(
    // int id,
    String excerpt,
    String body,
    double price,
    int consultationTypeId,
  ) async {
    try {
      AttributesModel attributes = AttributesModel(
        // id: id,
        excerpt: excerpt,
        body: body,
        price: price,
        consultationType_id: consultationTypeId,
      );
      await _service.addConsultation(attributes);
    } catch (e) {
      print(e);
    }
  }

  deleteConsultation(int consultationId, int userId) async {
    try {
      final success = await _service.deleteConsultation(consultationId);
      personalConsultations = await _service.getExpertConsultations(userId);
      notifyListeners();
      return (success);
    } catch (e) {
      print(e);
    }
  }
}
