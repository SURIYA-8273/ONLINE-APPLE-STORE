import 'package:flutter/material.dart';
import 'package:online_apple_store/models/category_model.dart';
import 'package:online_apple_store/models/product_model.dart';
import 'package:online_apple_store/pages/product_detail_page.dart';
import 'package:online_apple_store/utiles/colors.dart';
import 'package:online_apple_store/utiles/data/product_category.dart';
import 'package:online_apple_store/utiles/data/product_data.dart';
List<Map<String, dynamic>> _drawerList = [
  {
    "id": 1,
    "data": {
      "title": "Dashboard",
      "icon": Icons.dashboard,
      "links": "/lib/assets/"
    }
  },
  {
    "id": 2,
    "data": {
      "title": "Profile",
      "icon": Icons.person,
      "links": "/lib/profile/"
    }
  },
  {
    "id": 3,
    "data": {
      "title": "Settings",
      "icon": Icons.settings,
      "links": "/lib/settings/"
    }
  },
  {
    "id": 4,
    "data": {
      "title": "Notifications",
      "icon": Icons.notifications,
      "links": "/lib/notifications/"
    }
  },
  {
    "id": 5,
    "data": {
      "title": "Messages",
      "icon": Icons.message,
      "links": "/lib/messages/"
    }
  },
  {
    "id": 6,
    "data": {
      "title": "Favorites",
      "icon": Icons.favorite,
      "links": "/lib/favorites/"
    }
  },
  {
    "id": 7,
    "data": {
      "title": "Logout",
      "icon": Icons.logout,
      "links": "/lib/logout/"
    }
  },
];

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDrawerOpen = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(
          drawer: Drawer(
            child: customDrawer(context: context, onTap:(){} ),
          ),
            backgroundColor:Colors.white,
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      appBar(
                          leadingIcon: Icons.menu,
                          title: "Home",
                          leadingIconFunction: () {
                            setState(() {
                              isDrawerOpen = true;
                            });
                          },
                          trailingIcon: Icons.search_rounded,
                          trailingIconFunction: () {}),
                      SizedBox(
                        height: 25,
                      ),
                      bannerContainer(),
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
                      SizedBox(
                        height: 230,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productsData.length,
                            itemBuilder: (context, index) {
                              return productContainer(
                                context: context,
                                  productData: productsData[index]);
                            }),
                      )
                    ],
                  ),
                ),
                isDrawerOpen == true
                    ? customDrawer(
                        context: context,
                        onTap: () {
                          setState(() {
                            isDrawerOpen = false;
                          });
                        })



                    : SizedBox()
              ],
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
        child: Icon(leadingIcon, size: 26, color: Colors.black54),
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
              child: Icon(trailingIcon, size: 26, color: Colors.black54),
            ))
    ],
  );
}

Widget iconContainer({required InkWell inkWell}) {
  return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 2),
          // boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 2)],
          borderRadius: BorderRadius.circular(10)),
      child: inkWell);
}

Widget bannerContainer() {
  return Container(
    padding: EdgeInsets.all(22),
    height: 170,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Color(0xF20C0E22), borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Iphone 12 pro max",
              style: TextStyle(
                  color: Colors.white.withAlpha(950),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "30% Off",
              style: TextStyle(
                  color: Colors.white.withAlpha(950),
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text("Shop Now",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
        Container(
          height: 320,
          width: 90,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "lib/assets/iphone.png",
                  ),
                  fit: BoxFit.cover)),
        )
      ],
    ),
  );
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
              color: Color(0xF2F25F0C),
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
                  color: Color(0xF2F25F0C),
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

Widget productContainer({required BuildContext context,required ProductModel productData}) {
  return InkWell(
    onTap: () {

      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailPage()));

    },
    child: Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Container(
          padding: EdgeInsets.all(12),
          height: 230,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: lightGray),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Image.asset(
                width: 110,
                height: 140,
                productData.image,
                fit: BoxFit.fill,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: 100,
                          child: Text(
                            productData.name,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                      Text(
                       "\$\ ${productData.price}",
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF2F3134)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Icon(
                        Icons.favorite_outline,
                        size: 25,
                        color: Color(0xF2F25F0C),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
//
Widget customDrawer(
    {required BuildContext context, required Function() onTap}) {
  return Container(
    // padding: EdgeInsets.symmetric(horizontal: 20),
    height: MediaQuery.of(context).size.height,
    width: double.infinity,
    decoration: BoxDecoration(),

    child: Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          height: double.infinity,
          color: Colors.white,
          width: 260,
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 200.0,top: 10),
                child: InkWell(
                  onTap: onTap,
                  child: Icon(Icons.close, size: 30),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 20,
                    backgroundImage:AssetImage("lib/assets/iphone.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Suriya Sivakumar",
                          style:
                          TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500,
                              fontFamily:"")),
                      Text("suriyasivakumar80@gmail.com",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 2,
                indent: 10,
                endIndent: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(child: ListView.builder(
                  itemCount: _drawerList.length,
                  itemBuilder: (context, index) {
                    final data=_drawerList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xF2F25F0C),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Icon(
                                  data["data"]["icon"],
                                  size: 25,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              data["data"]["title"],
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
            ],
          )
          ,
        ),
        Container(
          height: double.infinity,
          color: Colors.black.withOpacity(0.7),
          width: 151.2,
        )
      ],
    ),
  );
}
