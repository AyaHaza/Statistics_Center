import 'dart:convert';
import '../../domain_layer/entities/question_entity.dart';

List<QestionsModel> qestionsModelFromJson(String str) => List<QestionsModel>.from(json.decode(str).map((x) => QestionsModel.fromJson(x)));

String qestionsModelToJson(List<QestionsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QestionsModel extends QestionsEntity{

  QestionsModel({
    required super.questions,
  });

  factory QestionsModel.fromJson(Map<String, dynamic> json) => QestionsModel(
    questions: List<String>.from(json["questions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "questions": List<dynamic>.from(questions.map((x) => x)),
  };
}
