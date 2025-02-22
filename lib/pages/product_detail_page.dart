import 'package:flutter/material.dart';
import 'package:online_apple_store/utiles/colors.dart';
import 'package:online_apple_store/utiles/data/iphone_colors.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              child: customButton(
                title: "Add to Cart",
                onTap: () {},
                color: orange,
                textColor: Colors.white,
                width: double.infinity,
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
                      title: "Details",
                      trailingIcon: Icons.favorite_outline,
                      trailingIconFunction: () {}),
                  SizedBox(height: 25),
                  imageContainer(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Iphone 12 pro max",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.yellow,),
                          Text(
                            "4.4 / 5",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customButton(
                          title: "Description",
                          onTap: () {},
                          color: Color(0xF2F25F0C),
                          textColor: Colors.white,
                          width: 175,
                          height: 50),
                      customButton(
                          title: "Reviews",
                          onTap: () {},
                          color: Color(0xF2F25F0C),
                          textColor: Colors.white,
                          width: 175,
                          height: 50),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      "The iPhone is a line of smartphones designed and manufactured by Apple Inc. "
                          "It was first introduced "
                          "in 2007 by Steve Jobs and has since become "
                          "one of the most popular and influential smartphones "
                          "in the world",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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


                ],
              ),
            )));

  }
}

Widget appBar(
    {required IconData leadingIcon,
    IconData? trailingIcon,
    required String title,
    Function()? leadingIconFunction,
    Function()? trailingIconFunction}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      iconContainer(
          inkWell: InkWell(
        onTap: leadingIconFunction,
        child: Icon(leadingIcon, size: 32, color: Colors.black54),
      )),
      Text(
        title,
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
      ),
      trailingIcon == null
          ? SizedBox()
          : iconContainer(
              inkWell: InkWell(
              onTap: leadingIconFunction,
              child: Icon(trailingIcon, size: 32, color: Colors.black54),
            ))
    ],
  );
}

Widget iconContainer({required InkWell inkWell}) {
  return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 2),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 2)],
          borderRadius: BorderRadius.circular(10)),
      child: inkWell);
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
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    child: Center(
        child: Text(
      title,
      style: TextStyle(
          color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
    )),
  );
}

Widget imageContainer() {
  return Container(
    padding: EdgeInsets.only(top: 30, left: 40, right: 40,bottom: 30),
    width: double.infinity,
    height: 220,
    decoration: BoxDecoration(
        color: lightGray, borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.arrow_back_ios_new,
          size: 30,
        ),
        Image.asset(
          "lib/assets/iphone.png",
          fit: BoxFit.fitHeight,
          height: 200,
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 30,
        ),
      ],
    ),
  );
}


Widget phoneColorContainer({required String image,required Color color}){
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 14),
        width: 65,
        height: 70,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.1)
            ),
            borderRadius: BorderRadius.circular(10),
            color: color
        ),
        child:  Center(
          child: Image.asset(
            image,
            fit: BoxFit.fill,
            height: double.infinity,
            width:double.infinity,
          ),
        ),
      ),
    ),
  );
}
