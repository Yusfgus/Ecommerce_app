import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool nameEnable = false;
  bool passEnable = false;
  bool addressEnable = false;
  bool phoneEnable = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              title: "Profile",
              backcolor: Colors.white,
              textColor: Colors.white),
          Container(
            width: 414,
            height: 194,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/account_wave.png'),
                // Replace with your image path
                fit: BoxFit.cover, // Adjust the image fit based on your needs
              ),
            ),
            child: Stack(
              //alignment: Alignment.bottomRight,
              children: [
                Positioned(
                    top: 5,
                    left: 15,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Yusfgus",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
                Positioned(
                  bottom: 0,
                  right: 38,
                  child: CircleAvatar(
                    child: Image.asset(
                      "assets/avatar.png",
                      width: 147,
                      height: 147,
                    ),
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
                UserInfo(
                    title: "Name",
                    value: "Yousef Mohamed",
                    icon: Icons.person_2_outlined,
                    enable: nameEnable),
                UserInfo(
                    title: "Password",
                    value: "blablabla",
                    icon: Icons.lock_open_sharp,
                    enable: passEnable),
                UserInfo(
                    title: "Address",
                    value: "Ain Shams",
                    icon: Icons.home_work_outlined,
                    enable: addressEnable),
                UserInfo(
                    title: "Phone number",
                    value: "01158689513",
                    icon: Icons.phone,
                    enable: phoneEnable),
              ],
            ),
          ),
          //     Container(
          //       margin: EdgeInsets.only(bottom: 40),
          //       width: 345,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [
          //           Container(
          //             width: 115, // Set the desired width
          //             height: 35, // Set the desired height
          //             decoration: BoxDecoration(
          //               color: Color(0xFFF3B812),
          //               borderRadius: BorderRadius.circular(42),
          //             ),
          //             child: ElevatedButton(
          //               onPressed: () {
          //                 // Add your button click logic here
          //               },
          //               child: Text('Save Changes', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),),
          //               style: ElevatedButton.styleFrom(
          //                 primary: Colors.transparent,  // Make the button background transparent
          //                 elevation: 0,  // Remove button shadow
          //               ),
          //           )
          //       ),
          // ]
          //       ),
          //     ),
        ],
      ),
    ));
  }
}
