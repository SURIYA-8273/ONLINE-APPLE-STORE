
import 'package:flutter/material.dart';
import 'package:online_apple_store/pages/checkout_page.dart';
import 'package:online_apple_store/pages/favourite_page.dart';
import 'package:online_apple_store/pages/home_page.dart';
import 'package:online_apple_store/pages/setting_page.dart';
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

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  List<Widget> bodyContent=[
    HomePage(),
    FavouritePage(),
    CheckoutPage(),
    SettingPage(),
  ];
  int selectedIndex=0;

  bool isDrawerOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:bodyContent[selectedIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (value){
          setState(() {
            selectedIndex=value;
          });
        },
      type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xF2F25F0C),
          unselectedItemColor: Colors.black,
        currentIndex: selectedIndex,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined,size: 32,),label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline,size: 32,),label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.card_travel_outlined,size: 32,),label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined,size: 32,),label: ""),
      ]),
    );
  }
}



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
          height: MediaQuery.of(context).size.height,
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
