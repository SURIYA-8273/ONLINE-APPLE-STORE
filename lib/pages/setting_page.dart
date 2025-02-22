import 'package:flutter/material.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:
      Scaffold(
          backgroundColor: Colors.white,
          body:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(height: 15,),
                  appBar(leadingIcon:Icons.arrow_back_ios_new,
                      title:"More",trailingIcon: Icons.more_vert_rounded),
                  SizedBox(height: 30,),
                  Text("General Notification",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  )),
                  ListTile(
                    title: Text("Push Notification",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),),
                    trailing: Switch(
                        value: true,
                        activeTrackColor: Color(0xF2F25F0C),
                        activeColor: Colors.white,
                        onChanged: (value){
                          setState(() {
                          });
                        }),
                  ),
                  Divider(height: 1,),
                      ListTile(
                        title: Text("New Job Notification",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),),
                        trailing: Switch(
                            value: true,
                            activeTrackColor: Color(0xF2F25F0C),
                            activeColor: Colors.white,
                            onChanged: (value){
                              setState(() {
                              });
                            }),
                      ),
                      Divider(height: 1,),
                      ListTile(
                        title: Text("Applied Status Notification",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),),
                        trailing: Switch(
                            value: true,
                            activeTrackColor: Color(0xF2F25F0C),
                            activeColor: Colors.white,
                            onChanged: (value){
                              setState(() {
                              });
                            }),
                      ),
                      Divider(height: 1,),
                      SizedBox(height: 30,),
                      Text("Message Notification",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                      )),
                      ListTile(
                        title: Text("Message",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),),
                        trailing: Switch(
                            value: true,
                            activeTrackColor: Color(0xF2F25F0C),
                            activeColor: Colors.white,
                            onChanged: (value){
                              setState(() {
                              });
                            }),
                      ),
                      Divider(height: 1,),

                      ListTile(
                        title: Text("Reminders",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),),
                        trailing: Switch(
                            value: true,
                            activeTrackColor: Color(0xF2F25F0C),
                            activeColor: Colors.white,
                            onChanged: (value){
                              setState(() {
                              });
                            }),
                      ),
                      Divider(height: 1,),
                      SizedBox(height: 30,),
                      Text("App Notification",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                      )),
                      ListTile(
                        title: Text("Sound",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),),
                        trailing: Switch(
                            value: true,
                            activeTrackColor: Color(0xF2F25F0C),
                            activeColor: Colors.white,
                            onChanged: (value){
                              setState(() {
                              });
                            }),
                      ),
                      Divider(height: 1,),

                      ListTile(
                        title: Text("Vibrate",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),),
                        trailing: Switch(
                            value: true,
                            activeTrackColor: Color(0xF2F25F0C),
                            activeColor: Colors.white,
                            onChanged: (value){
                              setState(() {
                              });
                            }),
                      ),
                      Divider(height: 1,),
                ]),
              ))),
    );;
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
