import '../../../../core/usecases/usecases.dart';
import '../entities/all_forms_entity.dart';
import '../repository/form_repository.dart';


class GetAllFormsUseCase implements UseCse<List<AllFormsEntity>,String>{
  final FormRepository formRepository;
  GetAllFormsUseCase(this.formRepository);

  @override
  Future<List<AllFormsEntity>> call( params) {
    return formRepository.getAllForms();
  }

}