import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../config/hive_config.dart';
import '../../../../../core/constants/constantsStringApp.dart';
import '../../../../../core/service/coreService.dart';
import '../../models/user_model.dart';
import 'auth_api_service.dart';

class AuthApiServiceImp implements AuthApiService{
  @override
  Future<bool> signUp(userEntity) async{
    print(apiTableUsersInfo);
    String jsonData = jsonEncode(UserModel.fromJson(userEntity));
    CoreService.responsee=await CoreService.dio.post(
        apiTableUsersInfo,
      data: jsonData,
      options: Options(
        headers: {
          'apikey':apikey
        }
      )
    );

    print(CoreService.responsee.statusCode);
    print(userEntity.firstName);
    Response response=await CoreService.dio.get(
        '${apiTableUsersInfo}?select=id&email=eq.${userEntity.email}',
        options: Options(
            headers: {
              'apikey':apikey
            }
        )
    );
    userHive!.put("id", response.data[0]['id']);
    print(userHive!.get("id"));


Response responseMale=await CoreService.dio.get(
        '${apiTableForms}?select=id&special_type=eq.male',
        options: Options(
            headers: {
              'apikey':apikey
            }
        ) 
    );
List idMaleForms= List.generate(responseMale.data.length,  (index) => responseMale.data[index]["id"],);
print(idMaleForms);


Response responseFemale=await CoreService.dio.get(
        '${apiTableForms}?select=id&special_type=eq.female',
        options: Options(
            headers: {
              'apikey':apikey
            }
        ) 
    );
List idFemaleForms= List.generate(responseFemale.data.length,  (index) => responseFemale.data[index]["id"],);
print(idFemaleForms);

Response responsePrimaryStudent=await CoreService.dio.get(
        '${apiTableForms}?select=id&special_type=eq.Primary School Student',
        options: Options(
            headers: {
              'apikey':apikey
            }
        ) 
    );
List idPrimaryStudentForms= List.generate(responsePrimaryStudent.data.length,  (index) => responsePrimaryStudent.data[index]["id"],);
print(idPrimaryStudentForms);

Response responseSecondryStudent=await CoreService.dio.get(
        '${apiTableForms}?select=id&special_type=eq.Secondry School Student',
        options: Options(
            headers: {
              'apikey':apikey
            }
        ) 
    );
List idSecondryStudentForms= List.generate(responseSecondryStudent.data.length,  (index) => responseSecondryStudent.data[index]["id"],);
print(idSecondryStudentForms);


Response responseUnversityStudent=await CoreService.dio.get(
        '${apiTableForms}?select=id&special_type=eq.University Student',
        options: Options(
            headers: {
              'apikey':apikey
            }
        ) 
    );
 
List idUnversityStudentForms= List.generate(responseUnversityStudent.data.length,  (index) => responseUnversityStudent.data[index]["id"],);
print(idUnversityStudentForms);
 print("object");
    print(userEntity.yourStudy);

    //conditions
    if(userEntity.gender=='female'){
      for(int i=0;i<idFemaleForms.length;i++){
          CoreService.responsee=await CoreService.dio.post(
            apiTableUsersAndForms,
            data: {
              "user_id":userHive!.get("id"),
              "form_id": idFemaleForms[i]
            },
            options: Options(
                headers: {
                  'apikey':apikey
                }
            )
        );
      }
    } print("object2");
    print(userEntity.yourStudy);

    if(userEntity.gender=='male'){
      for(int i=0;i<idMaleForms.length;i++){
          CoreService.responsee=await CoreService.dio.post(
          apiTableUsersAndForms,
          data: {
            "user_id":userHive!.get("id"),
            "form_id": idMaleForms[i]
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
      }
     }
    
     print("object3");
    print(userEntity.yourStudy);
    
    if(userEntity.yourStudy=='Primary School Student'){
      for(int i=0;i<idPrimaryStudentForms.length;i++){
        CoreService.responsee=await CoreService.dio.post(
          apiTableUsersAndForms,
          data: {
            "user_id":userHive!.get("id"),
            "form_id": idPrimaryStudentForms[i]
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
      }
    }
     print("object4");
    print(userEntity.yourStudy);
    if(userEntity.yourStudy=='Secondry School Student'){
      for(int i=0;i<idSecondryStudentForms.length;i++){
        CoreService.responsee=await CoreService.dio.post(
          apiTableUsersAndForms,
          data: {
            "user_id":userHive!.get("id"),
            "form_id": idSecondryStudentForms[i]
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
      }
    }
     print("object5");
    print(userEntity.yourStudy);
   
    if(userEntity.yourStudy=='University Student'){
      for(int i=0;i<idUnversityStudentForms.length;i++){
        CoreService.responsee=await CoreService.dio.post(
          apiTableUsersAndForms,
          data: {
            "user_id":userHive!.get("id"),
            "form_id": idUnversityStudentForms[i]
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
      }
      
    }
    return true;
  }
}