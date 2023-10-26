import 'package:amazon_clone/constants/globalVaiables.dart';
import 'package:amazon_clone/features/product_detials/screens/product_details_screen.dart';
import 'package:amazon_clone/features/services/home_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/loader.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {



 Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product==null? const Loader():product!.name.isEmpty? const SizedBox():GestureDetector(
      onTap: navigateToDetailScreen,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10,left: 10),
            alignment: Alignment.topLeft,
            child: const Text("Deal Of the Day",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
          ),
          Image.network(GlobalVariables.carouselImages[3],height: 235,fit: BoxFit.fitHeight,),
          Container(padding: const EdgeInsets.only(top:10,left: 5,right: 40),
           alignment: Alignment.topLeft,
           child: const Text("\$100",style: TextStyle(fontSize: 18,color: Colors.black),),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top:15,left: 5,right: 40,bottom: 10),
            child: const Text("Mahidhar",maxLines: 2,overflow: TextOverflow.ellipsis,),
          ),
          SingleChildScrollView(
    
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                    Image.network(GlobalVariables.carouselImages[3],height: 100,fit:BoxFit.cover,width:100),
                  Image.network(GlobalVariables.carouselImages[3],height: 100,fit:BoxFit.cover,width:100),
                  Image.network(GlobalVariables.carouselImages[3],height: 100,fit:BoxFit.cover,width:100),
                  Image.network(GlobalVariables.carouselImages[3],height: 100,fit:BoxFit.cover,width:100)            ],),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text("See all Deals",style: TextStyle(color: Colors.cyan[800]),),
          )
        ],
      ),
    );
  }
}