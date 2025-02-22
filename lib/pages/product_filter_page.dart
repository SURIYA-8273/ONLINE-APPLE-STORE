import 'package:flutter/material.dart';
import 'package:online_apple_store/utiles/colors.dart';
import 'package:online_apple_store/utiles/constants.dart';
import 'package:online_apple_store/utiles/data/iphone_colors.dart';
import 'package:online_apple_store/utiles/data/product_category.dart';


class ProductFilterPage extends StatefulWidget {
  const ProductFilterPage({super.key});

  @override
  State<ProductFilterPage> createState() => _ProductFilterPageState();
}

class _ProductFilterPageState extends State<ProductFilterPage> {
  RangeValues values=RangeValues(0.1, 0.5);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customButton(
                    title: "Reset",
                    onTap: () {},
                    color: lightGray,
                    textColor: Colors.black,
                    width: 185,
                  ),
                  customButton(
                    title: "Apply",
                    onTap: () {},
                    color: orange,
                    textColor: Colors.white,
                    width: 185,
                  )
                ],
              ),
            ),

            body: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  appBar(
                      leadingIcon: Icons.arrow_back_ios_new,
                      leadingIconFunction: () {
                        Navigator.pop(context);
                      },
                      title: "Filter",
                      trailingIcon: Icons.more_vert_rounded,
                      trailingIconFunction: () {}),

                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryData.length,
                        itemBuilder: (context, index) {
                          return categoryContainer(
                              title: categoryData[index].title,
                              categoryIcon:
                              categoryData[index].categoryIcon);
                        }),
                  ),
                  Text(
                    "Price Range",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  RangeSlider(
                      values: values,
                      activeColor:orange,
                      labels:RangeLabels(values.start.toString(),values.end.toString()),
                      onChanged: (value){setState(() {values=value;
                      });}),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$\300",style: TextStyle(fontWeight:
                        FontWeight.bold,fontSize: 16),),
                        Text("\$\1500",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Rating",style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15,),
                  SizedBox(
                      height: 50,
                      child:
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return ratingContainer(ratingNo: index+1);
                          })),
                  SizedBox(height: 20),
                  Text("Sory By",style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customButton(
                        title: "New Product",
                        onTap: () {},
                        color: orange,
                        textColor: Colors.white,
                        width: 175,
                        height: 50
                      ),
                      customButton(
                        title: "Top Rated",
                        onTap: () {},
                          color: lightGray,
                        textColor: Colors.black,
                        width: 175,
                          height: 50
                      )
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Select Color",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),


                  SizedBox(
                      height: 100,
                      child:
                      ListView.builder(
                        itemCount: iphoneColors.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return phoneColorContainer(
                                color: iphoneColors[index]["color"],
                            image: iphoneColors[index]["image"]);
                          })),
                  SizedBox(
                    height: 15,
                  ),


                ],
              ),
            )));
  }
}


Widget appBar({required IconData leadingIcon,IconData? trailingIcon,required
String title,Function()? leadingIconFunction,Function()? trailingIconFunction}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      iconContainer(inkWell: InkWell(onTap: leadingIconFunction,child: Center(child: Icon(leadingIcon,size: 32,color: Colors.black54)),)),
      Text(title,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
      trailingIcon == null ? SizedBox() :  iconContainer(inkWell: InkWell(onTap:
      leadingIconFunction,child: Icon(trailingIcon,size: 32,color: Colors.black54),
      )
      )
    ],
  );
}

Widget iconContainer({required InkWell inkWell}){
  return Container(
      padding: EdgeInsets.all(6),
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


Widget categoryContainer(
    {required String title,
      Function()? onTap,
      required IconData categoryIcon}) {
  return InkWell(
    onTap: onTap,
    child: Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: orange,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Icon(
                  categoryIcon,
                  size: 25,
                  color: orange,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white.withAlpha(950),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget customButton(
    {required String title,
      required Function() onTap,
      required Color color,
      required double width,
      double? height,
      required Color textColor}) {
  return Container(
    height: height,
    width: width,
    decoration:
    BoxDecoration(
      border: Border.all(color: Colors.black.withOpacity(0.1)),
        color: color, borderRadius: BorderRadius.circular(10)),
    child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
        )),
  );
}


Widget phoneColorContainer({required String image,required Color color}){
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
        width: 65,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1)
          ),
            borderRadius: BorderRadius.circular(10),
            color: color
        ),
        child:  Image.asset(
          image,
          fit: BoxFit.cover,
          height: 50,
          width: 25,
        ),
      ),
    ),
  );
}

Widget ratingContainer({required int ratingNo}){
  return Align(
    alignment: Alignment.center,
    child: Padding(padding: EdgeInsets.only(right: 15),child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 13),

      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1)
          ),
        borderRadius: BorderRadius.circular(10),
        color:ratingNo == 5 ? orange:lightGray
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star,size: 25,color: Colors.yellow,),
          SizedBox(width: 5,),
          Text(ratingNo.toString(),style:
          TextStyle(fontSize: 16,color: ratingNo != 5 ? Colors.black:Colors.white),)
        ],
      ),
    ),),
  );
}