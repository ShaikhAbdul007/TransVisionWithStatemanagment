import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tranvision_customer_app/utils/constant/colors.dart';



class MyButton{
  static customButton(String text, String myRoute){
    return ElevatedButton(onPressed: (){
      myRoute;
    }, child: Text(text, style: GoogleFonts.poppins(color: AppColor.buttonTextColor,fontSize: 18,fontWeight: FontWeight.bold)));
  }
}