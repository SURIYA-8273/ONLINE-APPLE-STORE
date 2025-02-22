import 'package:flutter/material.dart';
import 'package:online_apple_store/pages/product_filter_page.dart';
import 'package:online_apple_store/utiles/colors.dart';
class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:
      Scaffold(
          backgroundColor: Colors.white,
          body:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 120,
                  child: Column(children: [
                    SizedBox(height: 15,),
                    appBar(leadingIcon: Icons.arrow_back_ios_new,
                        title:"Wishlist",trailingIcon: Icons.search),
                    SizedBox(height: 30,),
                   headingContainer(context: context),
                    SizedBox(height: 30,),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            return productContainer();}),
                    ),

                  ]),
                ),
              ))),
    );
  }
}

Widget appBar({required IconData leadingIcon,IconData? trailingIcon,required
String title,Function()? leadingIconFunction,Function()? trailingIconFunction}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      iconContainer(inkWell: InkWell(onTap: leadingIconFunction,child:
      Center(child: Icon(leadingIcon,size: 26,color: Colors.black54)),)),
      Text(title,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
      trailingIcon == null ? SizedBox() :  iconContainer(inkWell: InkWell(onTap:
      leadingIconFunction,child: Icon(trailingIcon,size: 26,color: Colors.black54),
      )
      )
    ],
  );
}

Widget iconContainer({required InkWell inkWell}){
  return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300,width: 2),
          boxShadow: [BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 2
          )],
          borderRadius: BorderRadius.circular(10)
      ),
      child: inkWell);
}

Widget headingContainer({required BuildContext context}){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Apple Products",
            style: TextStyle(fontSize:
            21,fontWeight: FontWeight.bold),),
          Text("25 items",  style: TextStyle(fontSize:
          16,fontWeight: FontWeight.bold,color: Colors.grey),)
        ],
      ),
      iconContainer(inkWell: InkWell(onTap:
          (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>ProductFilterPage()));
          },child: Icon(Icons.filter_list_alt,size: 26,color: Colors.black54),
      )
      ),
    ],
  );
}

Widget productContainer(){
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 17.0),
            child: Container(
                padding: EdgeInsets.all(10),
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset("lib/assets/iphone.png",fit: BoxFit.fitHeight,)),
          ),

          SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0,top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Iphone 12",  style: TextStyle(fontSize:
                  20,fontWeight: FontWeight.bold,color: Colors.black,overflow: TextOverflow.ellipsis),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star,color: Colors.yellow,),
                      Icon(Icons.star_outline,color: Colors.yellow,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("\$\3000", style: TextStyle(
                      overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,
                      fontSize: 14,color: Color(0xFF2F3134)),)
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: Icon(Icons.favorite,size: 25,color: Color(0xF2F25F0C),),
            ),
          )
        ],
      ),
    ),
  );
}






