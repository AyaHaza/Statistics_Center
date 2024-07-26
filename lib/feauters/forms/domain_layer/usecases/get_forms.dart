import '../../../../core/usecases/stream_usecase.dart';
import '../entities/form.dart';
import '../repository/form.dart';

class GetFormsUseCase extends UseCseStream{
FormRepository formRepository;
GetFormsUseCase(this.formRepository);

  @override
  Stream<List<FormsEntity>> call(params) {
    return  formRepository.getForms();

  }
}