import 'package:amazon_clone/constants/globalVaiables.dart';
import 'package:amazon_clone/features/home/screens/category_products.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});




  @override
  Widget build(BuildContext context) {
    void navToCategory(String category){
Navigator.of(context).pushNamed(CategoryProducts.routeName,arguments:category);
}
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        itemExtent: 75,
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context,index){
             return GestureDetector(
              onTap:()=> navToCategory(GlobalVariables.categoryImages[index]['title']!),
               child: Column(
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(GlobalVariables.categoryImages[index]['image']!,fit: BoxFit.cover,height: 40,width: 40,),
                     
                    )
                  ),
                   Text(
                    GlobalVariables.categoryImages[index]['title']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
               ),
             );
      }),
    );
  }
}