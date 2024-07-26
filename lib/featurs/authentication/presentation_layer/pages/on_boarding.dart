import 'package:flutter/material.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/widgetsApp/widget_button.dart';

class OnBoarding extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image:  AssetImage("images/boarbing.gif")),
            const Text(onBoarS,style: TextStyle(color: black,fontSize: 50,fontFamily:"Josefin Sans",fontWeight: FontWeight.bold,shadows: [
                  BoxShadow(
                    color: black,
                    offset: Offset(1,1),
                    spreadRadius: 0.01,
                    blurRadius:1.0,
                  )
                ] ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text( descriptionS,style: TextStyle(color: black.withOpacity(0.6),fontSize: 16,fontFamily:"Josefin Sans",)),
            ),
            // SizedBox(height: 10,),
            ButtonCustom(150, 50, const Text(start,style: TextStyle(color: black,fontSize: 28,fontFamily:"Josefin Sans",)), yellow, white, (){Navigator.pushReplacementNamed(context, '/Signup');})
          ],
        ),
      ),
    );
  }
}