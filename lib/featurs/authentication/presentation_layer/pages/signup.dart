import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../core/service/serviceNtification.dart';
import '../../../../core/widgetsApp/TextFiledCustom.dart';
import '../../../../core/widgetsApp/widget_button.dart';
import '../../domain_layer/entities/user_entity.dart';
import '../providers/auth_provider.dart';
import '../widgets/drop_down.dart';

class Signup extends StatelessWidget {
  final TextEditingController firstName=TextEditingController();
  final TextEditingController lastName=TextEditingController();
  final TextEditingController email=TextEditingController();
  // final TextEditingController age=TextEditingController();
  final TextEditingController gender=TextEditingController();
  final TextEditingController yourStudy=TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: white,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
               Padding(
                padding: const EdgeInsets.only(left: 20.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(letsStartS,style: TextStyle(color: black,fontSize: 40,fontFamily:"Josefin Sans",fontWeight: FontWeight.bold,shadows: [
                  BoxShadow(
                    color: black,
                    offset: Offset(1,1),
                    spreadRadius: 0.01,
                    blurRadius:1.0,
                  )
                ] )),
                    Image.asset("images/signup.png",width: 200,height: 200,),
                  ],
                )
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 16),
                child: TextFiledCustom(yellow.withOpacity(0.07),1,firstName,const Icon(Icons.person_2_outlined,color: yellow),"First name",TextInputType.name,true),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 6),
                child: TextFiledCustom(yellow.withOpacity(0.07),1,lastName,const Icon(Icons.person_2_outlined,color: yellow,),"Last name",TextInputType.name,true),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 16),
                child: TextFiledCustom(yellow.withOpacity(0.07),1,email,const Icon(Icons.email_outlined,color: yellow,),"Email",TextInputType.emailAddress,true),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
              //   child: TextFiledCustom(yellow.withOpacity(0.07),1,age,const Icon(Icons.numbers_outlined,color: yellow,),"age"),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 6),
                child:  DropDown("Gender" ,gender,genderList,Icons.man_4_sharp),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 16),
                child:   DropDown("Study" ,yourStudy,yourStudyList,Icons.abc)

              ),
              const SizedBox(height: 80,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Consumer(
                  builder: (context, ref, child) {
                    return  ButtonCustom(150, 50, ref.watch(Auth).when(
                        data:(_)=>const Text(Register,style: TextStyle(fontFamily:"Josefin Sans", fontSize: 25,color: black),),
                        error: (error, _) => Text('Error: $error',style: const TextStyle(fontFamily:"Josefin Sans", fontSize: 30,color: black)),
                        loading:()=>const CupertinoActivityIndicator(color: black,))
                        ,yellow, white, () async{
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          formKey.currentState!.save();
                          UserEntity user=UserEntity(  firstName: firstName.text, lastName: lastName.text,email: email.text,gender: gender.text,age: 11,yourStudy: yourStudy.text);
                          ref.read(Auth.notifier).register(user).then((value) {
                            LocalNotificationService().uploadFcm();
                            return Navigator.pushReplacementNamed(context, '/AllForms');
                          } );
                        }
                    );
                  },
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}





                        
                        
           