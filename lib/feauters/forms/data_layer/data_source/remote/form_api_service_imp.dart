import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../core/constants/constantsStringApp.dart';
import '../../../../../core/constants/contantsVarApp.dart';
import '../../../../../core/service/coreService.dart';
import '../../../../../core/service/notification_service.dart';
import '../../../domain_layer/entities/form.dart';
import '../../models/form.dart';
import 'form_api_service.dart';

class FormApiServiceImp implements FormApiService{
  @override
  Stream<List<FormsEntity>> getForms() async*{
    CoreService.responsee=await CoreService.dio.get(
      "$apiTableForms?select=*",
      options: Options(
        headers: {
          "apiKey":apikey
        }
      )
    );
    var forms=List.generate(CoreService.responsee.data.length, (index) => FormsModel.fromJson(CoreService.responsee.data[index]),);
    yield forms;
  }
  
  @override
  Future<bool> addForm( formEntity) async {
    final _data =await json.encoder.convert(formEntity);
    CoreService.responsee=await CoreService.dio.post(
      apiTableForms,
      data: _data,
      options: Options(
        headers: {
          "apiKey":apikey
        }
      )
    );
    Response responsegender=await CoreService.dio.get(
        '$apiTableUsersInfo?select=notification!inner(notificationToken)&gender=eq.${formEntity.specialType}',
        options: Options(
            headers: {
              'apikey':apikey
            }
        ) 
    );
 List tokenUsers= List.generate(responsegender.data.length,  (index) => responsegender.data[index]["notification"][0]["notificationToken"],);


Response responsStudy=await CoreService.dio.get(
        '$apiTableUsersInfo?select=notification!inner(notificationToken)&your_study=eq.${formEntity.specialType}',
        options: Options(
            headers: {
              'apikey':apikey
            }
        ) 
    );
 List tokenUsersS= List.generate(responsStudy.data.length,  (index) => responsStudy.data[index]["notification"][0]["notificationToken"],);


    for(int i=0;i<tokenUsers.length;i++){
    NotificationServer().pushNotifications(title: "Statistics and Planning Center ",body: "there is new form suitable for your gender ",token: tokenUsers[i]);

  }

  for(int i=0;i<tokenUsersS.length;i++){
    NotificationServer().pushNotifications(title: "Statistics and Planning Center ",body: "there is new form suitable for your study ",token: tokenUsersS[i]);
  }
    return true;
}

  @override
  Future<bool> editForm( formEntity)async {
    final _data =await json.encoder.convert(formEntity);
    CoreService.responsee=await CoreService.dio.patch(
      "$apiTableForms?name_form=eq.$nameFor",
      data: _data,
      options: Options(
        headers: {
          "apiKey":apikey
        }
      )
    );
    print(CoreService.responsee.statusCode);

     Response responsegender=await CoreService.dio.get(
        '$apiTableUsersInfo?select=notification!inner(notificationToken)&gender=eq.${formEntity.specialType}',
        options: Options(
            headers: {
              'apikey':apikey
            }
        ) 
    );
 List tokenUsers= List.generate(responsegender.data.length,  (index) => responsegender.data[index]["notification"][0]["notificationToken"],);

Response responsStudy=await CoreService.dio.get(
        '$apiTableUsersInfo?select=notification!inner(notificationToken)&your_study=eq.${formEntity.specialType}',
        options: Options(
            headers: {
              'apikey':apikey
            }
        ) 
    );
 List tokenUsersS= List.generate(responsStudy.data.length,  (index) => responsStudy.data[index]["notification"][0]["notificationToken"],);

if(formEntity.specialType=="male"||formEntity.specialType=="female"){
  for(int i=0;i<tokenUsers.length;i++){
  NotificationServer().pushNotifications(title: "Statistics and Planning Center ",body: "there is new form suitable for your gender ",token: tokenUsers[i]);
}
}


if(formEntity.specialType=='Primary School Student'||formEntity.specialType=='Secondry School Student'||formEntity.specialType=='University Student'){
for(int i=0;i<tokenUsersS.length;i++){
  NotificationServer().pushNotifications(title: "Statistics and Planning Center ",body: "there is new form suitable for your study ",token: tokenUsersS[i]);
}
}
     return true;
  }
 
}

