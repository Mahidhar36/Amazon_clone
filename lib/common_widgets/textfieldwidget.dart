import 'package:amazon_clone/constants/globalVaiables.dart';
import 'package:flutter/material.dart';

class TextFiled extends StatelessWidget {
  
final TextEditingController textEditingController;
final  String  hinttext;
final int maxLines;
  const TextFiled({super.key,required this.textEditingController,required this.hinttext,this.maxLines=1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
    
      decoration:  InputDecoration(
        hintText: hinttext,
      
      border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color:  Colors.black38
        )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: GlobalVariables.secondaryColor,
        width: 2.0),
      
      ),
      enabledBorder:OutlineInputBorder(
        
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color:  Colors.black38
        ) 
        
      
      ),
    
      ),
      validator: (val){
        if(val==null|| val.isEmpty) {
          return 'Enter your $hinttext';
        }

        return null;
      },
      maxLines: maxLines,
    );
  }
}