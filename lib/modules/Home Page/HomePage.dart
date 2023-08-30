import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomePage> {
   List<bool> itemSelected = List.generate(6, (index) => false);
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
    var searchController = TextEditingController();
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 10.0,
                end: 20.0,
                top: 10.0,
              ),
              child: Row(
               // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 10.0,
                      top: 20.0,
                    ),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
                  ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsetsDirectional.only(
                       start: 10.0,
                       end: 10.0,
                       top: 20.0,
                     ),
                     child: Container(
                       height: 50.0,
                       child: TextFormField(
                         onTap: (){},
                         decoration: InputDecoration(
                           label: Text('Search for a Product ...' ,
                           style: TextStyle(
                             color: Colors.grey,
                           ),),
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                           suffixIcon:  IconButton(
                             icon: Center(child: Icon(Icons.search_sharp , color: Colors.grey,)),
                             iconSize: 40.0,
                             onPressed: () {},
                             color: Colors.white,
                           ),
                         ),
                       ),
                     ),
                   ),
                 ),
                ],
              ),
            ),
            Material(
              elevation: 10.0,
              child: Container(
                height: 70,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10.0,
                        end: 10.0,
                        top: 20.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            itemSelected = List.generate(6, (index) => false);
                            itemSelected[index] = !itemSelected[index];
                          });
                        },
                        child:  Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                start: 10.0,
                              ),
                              child: Container(
                                width: 100,
                                height: 35.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                  color: itemSelected[index] ? Colors.blue : Colors.transparent,
                                ),

                                child: Center(
                                  child: Text(
                                    'Smart Phones',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: itemSelected[index] ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.only(
                            //     start: 10.0,
                            //     end: 10.0,
                            //   ),
                            //   child: Container(
                            //     width: 100,
                            //     height: 50.0,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(
                            //         15.0,
                            //       ),
                            //       color: itemSelected[index] ? Colors.blue : Colors.transparent,
                            //     ),
                            //
                            //     child: Center(
                            //       child: Text(
                            //         'Smart Phones',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: itemSelected[index] ? Colors.white : Colors.black,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.only(
                            //     start: 10.0,
                            //     end: 10.0,
                            //   ),
                            //   child: Container(
                            //     width: 100,
                            //     height: 50.0,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(
                            //         15.0,
                            //       ),
                            //       color: itemSelected[index] ? Colors.blue : Colors.transparent,
                            //     ),
                            //
                            //     child: Center(
                            //       child: Text(
                            //         'Smart Phones',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: itemSelected[index] ? Colors.white : Colors.black,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.only(
                            //     start: 10.0,
                            //     end: 10.0,
                            //   ),
                            //   child: Container(
                            //     width: 100,
                            //     height: 50.0,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(
                            //         15.0,
                            //       ),
                            //       color: itemSelected[index] ? Colors.blue : Colors.transparent,
                            //     ),
                            //
                            //     child: Center(
                            //       child: Text(
                            //         'Smart Phones',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: itemSelected[index] ? Colors.white : Colors.black,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.only(
                            //     start: 10.0,
                            //     end: 10.0,
                            //   ),
                            //   child: Container(
                            //     width: 100,
                            //     height: 50.0,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(
                            //         15.0,
                            //       ),
                            //       color: itemSelected[index] ? Colors.blue : Colors.transparent,
                            //     ),
                            //
                            //     child: Center(
                            //       child: Text(
                            //         'Smart Phones',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: itemSelected[index] ? Colors.white : Colors.black,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.only(
                            //     start: 10.0,
                            //     end: 10.0,
                            //   ),
                            //   child: Container(
                            //     width: 100,
                            //     height: 50.0,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(
                            //         15.0,
                            //       ),
                            //       color: itemSelected[index] ? Colors.blue : Colors.transparent,
                            //     ),
                            //
                            //     child: Center(
                            //       child: Text(
                            //         'Smart Phones',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: itemSelected[index] ? Colors.white : Colors.black,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 0.0,
                    ),
                    itemCount: 6),
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
                        Expanded(
                          child: Padding(
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
                        ),
                        Expanded(
                          child: Padding(
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
