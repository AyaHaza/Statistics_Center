import 'dart:convert';
import '../../domain_layer/entities/all_forms_entity.dart';


List<AllFormsModel> allFormsModelFromJson(String str) => List<AllFormsModel>.from(json.decode(str).map((x) => AllFormsModel.fromJson(x)));

String allFormsModelToJson(List<AllFormsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllFormsModel extends AllFormsEntity {

  AllFormsModel({
    required super.firstName,
    required super.usesAndForms,
  });

  factory AllFormsModel.fromJson(Map<String, dynamic> json) => AllFormsModel(
    firstName: json["first_name"],
    usesAndForms: List<UsesAndForm>.from(json["uses_and_forms"].map((x) => UsesAndForm.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "uses_and_forms": List<dynamic>.from(usesAndForms.map((x) => x.toJson())),
  };
}
class UsesAndForm {
  Forms forms;

  UsesAndForm({
    required this.forms,
  });

  factory UsesAndForm.fromJson(Map<String, dynamic> json) => UsesAndForm(
    forms: Forms.fromJson(json["forms"]),
  );

  Map<String, dynamic> toJson() => {
    "forms": forms.toJson(),
  };
}

class Forms {
  String nameForm;

  Forms({
    required this.nameForm,
  });

  factory Forms.fromJson(Map<String, dynamic> json) => Forms(
    nameForm: json["name_form"],
  );

  Map<String, dynamic> toJson() => {
    "name_form": nameForm,
  };
}
