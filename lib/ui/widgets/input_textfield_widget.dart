import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class InputTextfieldWidget extends StatelessWidget {

  String iconTextField;
  String fieldName;
  int? maxLines;
  TextEditingController controllerName;

  InputTextfieldWidget({required this.controllerName,required this.fieldName, required this.iconTextField, this.maxLines,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0,),
      child: TextField(
        controller: controllerName,
        style: GoogleFonts.poppins(
          color: Colors.white,
        ),
        maxLines: maxLines,
        cursorColor: kSecondaryColor,
        decoration: InputDecoration(
          hintText: fieldName,
          hintStyle: GoogleFonts.poppins(
            color: Colors.white54,
            fontSize: 14,
          ),
          filled: true,
          fillColor: Color(0xff2A2D37),
          prefixIcon: SvgPicture.asset(
            iconTextField,//'assets/images/bxl-book.svg',
            color: Colors.white54,
            fit: BoxFit.scaleDown,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}