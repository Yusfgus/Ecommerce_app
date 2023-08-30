import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomePage> {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  String selectedItem = '';
  bool colort = false;
  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 30,
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: 15.0),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Row(
                      children:
                      [
                        Text(
                          'Smart Phone',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Laptops',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Fragrances',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Skin care',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Home decoration',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'groceries',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20.0,
                    ),
                    itemCount: 1),
              ),
            ),
           ListView.separated(
             shrinkWrap: true,
             scrollDirection: Axis.vertical,
               physics: NeverScrollableScrollPhysics(),
               itemBuilder: (context, index) {
                 return GestureDetector(
                   onTap: () {
                     setState(() {
                       colort = !colort;
                       print(index);
                     });
                   },
                   child: Row(
                     children: [
                       Padding(
                         padding: const EdgeInsetsDirectional.only(
                           start: 10.0,
                           end: 10.0,
                           bottom: 20.0,
                         ),
                         child: Container(
                           height: 200,
                           width: 174,
                           decoration: BoxDecoration(
                             // color: Color(0xFFE2F2FA),
                             borderRadius: BorderRadius.circular(15.0),
                             border: Border.all(
                               color: Color(0xFF3A2A08),
                               // Set the desired border color here
                               width: 1, // Set the desired border width here
                             ),
                             color: colort ? Color(0xFF3A2A08) : Colors.blue,
                           ),
                           child: Column(
                             children: [
                               Image(
                                 image: NetworkImage(
                                     'https://www.asus.com/media/Odin/Websites/global/Series/9.png'),
                                 fit: BoxFit.cover,
                                 height: 150.0,
                                 width: 130.0,
                               ),
                               Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsetsDirectional.only(
                                       start: 5.0,
                                     ),
                                     child: Container(
                                       width: 100.0,
                                       child: Text(
                                         'Product Name',
                                         style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 13.0,
                                         ),
                                         maxLines: 2,
                                         overflow: TextOverflow.ellipsis,
                                       ),
                                     ),
                                   ),
                                   Expanded(
                                     child: SizedBox(
                                       // width: 15.0,
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsetsDirectional.only(
                                       end: 5.0,
                                     ),
                                     child: Column(
                                       children: [
                                         Text(
                                           '1500\$',
                                           style: TextStyle(
                                             fontWeight: FontWeight.w900,
                                             fontSize: 13.0,
                                           ),
                                         ),
                                         SizedBox(
                                           height: 3.0,
                                         ),
                                         Text(
                                           '1222\$',
                                           style: TextStyle(
                                             fontWeight: FontWeight.w300,
                                             fontSize: 12.0,
                                             color: Colors.grey[900],
                                             decoration: TextDecoration.lineThrough,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsetsDirectional.only(
                           start: 10.0,
                           end: 10.0,
                           bottom: 20.0,
                         ),
                         child: Container(
                           height: 200,
                           width: 174,
                           decoration: BoxDecoration(
                             // color: Color(0xFFE2F2FA),
                             borderRadius: BorderRadius.circular(15.0),
                             border: Border.all(
                               color: Color(0xFF3A2A08),
                               // Set the desired border color here
                               width: 1, // Set the desired border width here
                             ),
                             color: colort ? Color(0xFF3A2A08) : Colors.blue,
                           ),
                           child: Column(
                             children: [
                               Image(
                                 image: NetworkImage(
                                     'https://www.asus.com/media/Odin/Websites/global/Series/9.png'),
                                 fit: BoxFit.cover,
                                 height: 150.0,
                                 width: 130.0,
                               ),
                               Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsetsDirectional.only(
                                       start: 5.0,
                                     ),
                                     child: Container(
                                       width: 100.0,
                                       child: Text(
                                         'Product Name',
                                         style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 13.0,
                                         ),
                                         maxLines: 2,
                                         overflow: TextOverflow.ellipsis,
                                       ),
                                     ),
                                   ),
                                   Expanded(
                                     child: SizedBox(
                                       // width: 15.0,
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsetsDirectional.only(
                                       end: 5.0,
                                     ),
                                     child: Column(
                                       children: [
                                         Text(
                                           '1500\$',
                                           style: TextStyle(
                                             fontWeight: FontWeight.w900,
                                             fontSize: 13.0,
                                           ),
                                         ),
                                         SizedBox(
                                           height: 3.0,
                                         ),
                                         Text(
                                           '1222\$',
                                           style: TextStyle(
                                             fontWeight: FontWeight.w300,
                                             fontSize: 12.0,
                                             color: Colors.grey[900],
                                             decoration: TextDecoration.lineThrough,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                       ),
                     ],
                   ),
                 );
               },
               separatorBuilder: (context, index) => SizedBox(height: 10.0,) ,
               itemCount: 10),
          ],
        ),
      ),
    );
  }
}
