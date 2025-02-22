
import 'package:flutter/material.dart';
import 'package:online_apple_store/utiles/colors.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: 
        Scaffold(
          backgroundColor: Colors.white,
          body:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
              child: Column(children: [
                SizedBox(height: 15,),
                appBar(leadingIcon:Icons.arrow_back_ios_new, title:"Checkout",trailingIcon: Icons.search),
                SizedBox(height: 25,),

                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                          itemCount: 1,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            return productContainer();}

                  ),
                ),
                paymentDetailsContainer()
              ]))),
        );
  }
}


Widget appBar({required IconData leadingIcon,IconData? trailingIcon,required
String title,Function()? leadingIconFunction,Function()? trailingIconFunction}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      iconContainer(inkWell: InkWell(onTap:
      leadingIconFunction,child: Center(child: Icon(leadingIcon,size: 26,color: Colors.black54)),)),
      Text(title,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
      trailingIcon == null ? SizedBox() :  iconContainer(inkWell: InkWell
        (onTap: leadingIconFunction,child: Icon(trailingIcon,size: 26,color: Colors.black54),))
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
Widget productContainer(){
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: lightGray
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Image.asset("lib/assets/iphone.png")),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text("Iphone 12  ",style: TextStyle(color:
              Colors.black,fontSize: 22,fontWeight:FontWeight.bold ),
              ),              SizedBox(height: 10,),
              Text("phone",style: TextStyle(color:
              Colors.black,fontSize: 18,fontWeight:FontWeight.normal ),),
              SizedBox(height: 10,),
              Text("\$3000",style: TextStyle(color:
              Colors.black,fontSize: 22,fontWeight:FontWeight.bold ),),
            ],
          ),
          SizedBox(width: 40,),
          Container(
            height: 150,
            width: 45,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
            ),
            child: 
            Column(
              children: [
                SizedBox(height: 3,),
                Text("+",style: TextStyle(color:
                Colors.black,fontSize: 30,fontWeight:FontWeight.bold ),),
                Text("1",style: TextStyle(color:
                Colors.black,fontSize: 20,fontWeight:FontWeight.bold ),),
                Text("-",style: TextStyle(color:
                Colors.black,fontSize: 30,fontWeight:FontWeight.bold ),)
              ],
            ),
          )
        ],
      ),
    ),
  );
}


Widget paymentDetailsContainer(){
  return   Container(
    padding: EdgeInsets.all(10),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0x5ED2D8E1),blurRadius: 1,spreadRadius: 2
          )
        ]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order Info",style: TextStyle(color:
        Colors.black,fontSize: 20,fontWeight:FontWeight.bold )),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: TextStyle(color:
            Color(0xFFB3B6BB),fontSize: 16,fontWeight:FontWeight.bold )),
            Text("\$3000",style: TextStyle(color:
            Color(0xFFB3B6BB),fontSize: 16,fontWeight:FontWeight.bold ))
          ],
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Delivery Fee",style: TextStyle(color:
            Color(0xFFB3B6BB),fontSize: 16,fontWeight:FontWeight.bold )),
            Text("\$100",style: TextStyle(color:
            Color(0xFFB3B6BB),fontSize: 16,fontWeight:FontWeight.bold ))
          ],
        ),   SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Discount",style: TextStyle(color:
            Color(0xFFB3B6BB),fontSize: 16,fontWeight:FontWeight.bold )),
            Text("\$100",style: TextStyle(color:
            Color(0xFFB3B6BB),fontSize: 16,fontWeight:FontWeight.bold ))
          ],
        ),   SizedBox(height: 10,),
        Divider(height: 1,color: Color(0x5ED2D8E1),indent: 30,endIndent: 30,),
        SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: TextStyle(color:
            Colors.black,fontSize: 16,fontWeight:FontWeight.bold )),
            Text("\$3000",style: TextStyle(color:
            Colors.black,fontSize: 16,fontWeight:FontWeight.bold ))
          ],
        ),


      ],
    ),
  );
}
