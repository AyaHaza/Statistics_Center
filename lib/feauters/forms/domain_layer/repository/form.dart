
import '../entities/form.dart';

abstract class FormRepository{
  Stream<List<FormsEntity>> getForms();
  Future<bool> addForm( formEntity);
  Future<bool> editForm( formEntity);
}