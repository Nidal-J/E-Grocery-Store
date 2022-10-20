import 'dart:ui';
import 'package:get/utils.dart';

class FaqsModel {
  late int id;
  late String questionEn;
  late String questionAr;
  late String question;
  late String answerEn;
  late String answerAr;
  late String answer;

  FaqsModel();

  FaqsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEn = json['question_en'];
    questionAr = json['question_ar'];
    question = Get.locale == const Locale('ar') ? questionAr : questionEn;
    answerEn = json['answer_en'];
    answerAr = json['answer_ar'];
    answer = Get.locale == const Locale('ar') ? answerAr : answerEn;
  }
}
