import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nemo_app/shared/components/components.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 414,
                  height: 294,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/account_wave.png'),
                      // Replace with your image path
                      fit: BoxFit
                          .cover, // Adjust the image fit based on your needs
                    ),
                  ),
                  child: Stack(
                    //alignment: Alignment.bottomRight,
                    children: [
                      Positioned(
                          top: 45,
                          left: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: () {},
                                      icon: Icon(
                                          Icons.arrow_back_ios_new_rounded)),
                                  SizedBox(width: 100,),
                                  Text("Profile", style: TextStyle(fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),)
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Text("Yusfgus", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500),),
                                ],
                              )
                            ],
                          )
                      ),
                      Positioned(
                        bottom: 0,
                        right: 38,
                        child: CircleAvatar(
                          child: Image.asset(
                            "assets/avatar.png", width: 147, height: 147,),
                          backgroundColor: Colors.white,
                          radius: 75,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      UserInfo(title: "Name",
                          value: "Yousef Mohamed",
                          icon: Icons.person_2_outlined),
                      UserInfo(title: "Password",
                          value: "blablabla",
                          icon: Icons.lock_open_sharp),
                      UserInfo(title: "Address",
                          value: "Ain Shams",
                          icon: Icons.home_work_outlined),
                      UserInfo(title: "Phone number",
                          value: "01158689513",
                          icon: Icons.phone),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  width: 345,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 115, // Set the desired width
                        height: 35, // Set the desired height
                        decoration: BoxDecoration(
                          color: Color(0xFFF3B812),
                          borderRadius: BorderRadius.circular(42),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your button click logic here
                          },
                          child: Text('Save Changes', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,  // Make the button background transparent
                            elevation: 0,  // Remove button shadow
                          ),
                      )
                  ),
          ]
                  ),
                )
              ]
          ),
        )
    );
  }
}