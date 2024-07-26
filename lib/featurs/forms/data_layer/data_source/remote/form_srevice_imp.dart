import 'package:dio/dio.dart';
import '../../../../../config/hive_config.dart';
import '../../../../../core/constants/constantsStringApp.dart';
import '../../../../../core/service/coreService.dart';
import '../../../domain_layer/entities/all_forms_entity.dart';
import '../../../domain_layer/entities/question_entity.dart';
import '../../models/all_forms_model.dart';
import '../../models/question_model.dart';
import 'form_service.dart';
List<QestionsEntity> allquestions=[];
class FormApiServiceImp implements FormApiService{
  @override
  Future<List<AllFormsEntity>> getAllFormsApi() async{
    print(apiTableUsersInfo);
    print(userHive!.get("id"));
    CoreService.responsee=await CoreService.dio.get(
        '${apiTableUsersInfo}?select=first_name,uses_and_forms!inner(forms(name_form))&id=eq.${userHive!.get("id")}',
        options: Options(
            headers: {
              'apikey':apikey
            }
        )
    );
    print(CoreService.responsee.statusCode);
    print(CoreService.responsee.data[0]["uses_and_forms"]);
    var allForms=List.generate(CoreService.responsee.data.length, (index) => AllFormsModel.fromJson(CoreService.responsee.data[index]));
    print(allForms);

    return allForms;
  }



  @override
  Future<List<QestionsEntity>> getQestionsFormsApi(nameForm) async {
    print(apiTableForms);
    CoreService.responsee=await CoreService.dio.get(
        '${apiTableForms}?select=questions&name_form=eq.${nameForm}',
        options: Options(
            headers: {
              'apikey':apikey
            }
        )
    );
    print(CoreService.responsee.statusCode);
    print(CoreService.responsee.data[0]["questions"]);
     allquestions=List.generate(CoreService.responsee.data.length, (index) => QestionsModel.fromJson(CoreService.responsee.data[index]));
    print(allquestions);
    return allquestions;
  }


}