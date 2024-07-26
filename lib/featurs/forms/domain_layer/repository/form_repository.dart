import '../entities/all_forms_entity.dart';
import '../entities/question_entity.dart';

abstract class FormRepository{
  Future<List<AllFormsEntity>> getAllForms();
  Future<List<QestionsEntity>> getQestionsForms(nameForm);
}