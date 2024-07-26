import '../../../../core/usecases/usecases.dart';
import '../entities/question_entity.dart';
import '../repository/form_repository.dart';


class GetQuestionFormsUseCase implements UseCse<List<QestionsEntity>,String>{
  final FormRepository formRepository;
  GetQuestionFormsUseCase(this.formRepository);

  @override
  Future<List<QestionsEntity>> call( params) {
    print("three");
    return formRepository.getQestionsForms(params) ;
  }

}