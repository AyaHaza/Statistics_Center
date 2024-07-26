
import 'dart:convert';
import '../../domain_layer/entities/form.dart';


List<FormsModel> formsModelFromJson(String str) => List<FormsModel>.from(json.decode(str).map((x) => FormsModel.fromJson(x)));

String formsModelToJson(List<FormsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FormsModel extends FormsEntity{
   
    FormsModel({
         super.questions,
         super.nameForm,
         super.type,
         super.specialType,
    });

    factory FormsModel.fromJson(Map<String, dynamic> json) => FormsModel(
        questions: json["questions"] == null ? [] : List<String>.from(json["questions"]!.map((x) => x)),
        nameForm: json["name_form"],
        type: json["type"],
        specialType: json["special_type"],
    );

    Map<String, dynamic> toJson() => {
        "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x)),
        "name_form": nameForm,
        "type": type,
        "special_type": specialType,
    };
}
