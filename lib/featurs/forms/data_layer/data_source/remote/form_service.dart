import '../../../domain_layer/entities/all_forms_entity.dart';
import '../../../domain_layer/entities/question_entity.dart';

abstract class FormApiService{
  Future<List<AllFormsEntity>> getAllFormsApi();
  Future<List<QestionsEntity>> getQestionsFormsApi(nameForm);

}