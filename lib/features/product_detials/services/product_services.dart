

import 'dart:convert';

import 'package:amazon_clone/common_widgets/error_handling.dart';

import 'package:amazon_clone/constants/globalVaiables.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class ProductServices{
void RatingAProduct(
  {
    required BuildContext context,
    required Product product,
    required double rating
  }
)async{
  final userProvider = Provider.of<UserProvider>(context, listen: false);
try{
  

          http.Response res = await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          "id":product.id,
          
          "rating":rating

             }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {}
          
      );

}catch(e){
  print(e.toString());
}
}
}