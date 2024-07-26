import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../injection_container.dart';
import '../../domain_layer/entities/all_forms_entity.dart';
import '../../domain_layer/entities/question_entity.dart';
import '../../domain_layer/usecases/getForms.dart';
import '../../domain_layer/usecases/getQuestions.dart';

final getData = FutureProvider.autoDispose<List<AllFormsEntity>>((ref) {
  return ref.read(forms.notifier).getForm();
});

final getQuestions = FutureProvider.autoDispose<List<QestionsEntity>>((ref) {
  print("one");
  return ref.read(forms.notifier).getQuestion(nameForm);
},);

final forms=StateNotifierProvider<formsNotifier,AsyncValue<bool>>((ref){
  return formsNotifier(sl(),sl());
});

class formsNotifier extends StateNotifier<AsyncValue<bool>>{
  final GetAllFormsUseCase getAllFormsUseCase;
  final GetQuestionFormsUseCase getQuestionFormsUseCase;
  formsNotifier(this.getAllFormsUseCase,this.getQuestionFormsUseCase) : super(AsyncValue.data(false));

  Future<List<AllFormsEntity>> getForm()async{
    var result= await getAllFormsUseCase.call("get");
      return result;
  }

  Future<List<QestionsEntity>> getQuestion(nameForm){
    return getQuestionFormsUseCase.call(nameForm);
  }
}
