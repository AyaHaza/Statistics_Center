import '../../../domain_layer/entities/form.dart';

abstract class FormApiService{
  Stream<List<FormsEntity>> getForms();
  Future<bool> addForm( formEntity);
  Future<bool> editForm( formEntity);
}