import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nemo_app/shared/Cubit/cubit.dart';

import '../../shared/Cubit/states.dart';
import '../../shared/components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomePage> {
  final List<String> categories = [
    'Smart Phones',
    'Laptops',
    'Home Decoration',
    'Skincare',
    'Fragrances',
    'Groceries',
  ];
  int selectedIndex = 0;
  int itemCount = 10;
  List<int> test = [5,6,7,8,9,10];
  List<Widget> itemType = [
    itemBuilder(url:  'https://www.trustedreviews.com/wp-content/uploads/sites/54/2023/02/Samsung-Galaxy-S23-Ultra-review-5-1024x580.jpg',
        productName: 'Smart Phone',
        price: '1500 \$',
        discount: '1750 \$',
    ),
    itemBuilder(url: 'https://www.asus.com/media/Odin/Websites/global/Series/9.png',
      productName: 'Laptops',
      price: '1500 \$',
      discount: '1750 \$',
    ),
    itemBuilder(url: 'https://eg.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/67/788302/1.jpg?7924',
      productName: 'Home Decoration',
      price: '1500 \$',
      discount: '1750 \$',
    ),
    itemBuilder(url: 'https://amalabeauty.com/cdn/shop/files/Full_Travel_Closer_2_2000x.jpg?v=1683558212',
      productName: 'Skincare',
      price: '1500 \$',
      discount: '1750 \$',
    ),
    itemBuilder(url: 'https://www.loccitane.com/dw/image/v2/BDQL_PRD/on/demandware.static/-/Library-Sites-OCC_SharedLibrary/default/dwa2626b7c/images/CLP/women_fragrances_module.jpg?sw=754&sh=477',
      productName: 'Fragrances',
      price: '1500 \$',
      discount: '1750 \$',
    ),
    itemBuilder(url: 'https://hips.hearstapps.com/hmg-prod/images/how-to-save-money-on-groceries-1673472736.png?crop=0.671xw:1.00xh;0,0&resize=1200:*',
      productName: 'Groceries',
      price: '1500 \$',
      discount: '1750 \$',
    ),
  ];
  int indexxxxxxxxx = 0;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, index) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //search
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10.0,
                        end: 20.0,
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //back icon
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                start: 10.0,
                                top: 20.0,
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_back_ios)),
                            ),
                            //text form field
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
                                    onTap: () {},
                                    decoration: InputDecoration(
                                      label: Text(
                                        'Search for a Product ...',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFF3B812),
                                              width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(25.0)),
                                      suffixIcon: IconButton(
                                        icon: Center(
                                            child: Icon(
                                          Icons.search_sharp,
                                          color: Color(0xFFF3B812),
                                        )),
                                        iconSize: 35.0,
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
                    ),
                  ),
                  //categories
                  Material(
                    elevation: 5.0,
                    child: Container(
                      height: 50,
                      color: Colors.white,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    indexxxxxxxxx = index;
                                    print(index);
                                  });
                                },
                                child: Column(
                                  children: [
                                    tapBarItem(
                                      label: categories[index],
                                      width:
                                          categories[index] == 'Home Decoration'
                                              ? 120.0
                                              : 100.0,
                                      coloor: selectedIndex == index
                                          ? Colors.white
                                          : Colors.transparent,
                                    ),
                                    Container(
                                      width: 65,
                                      height: 4,
                                      margin: EdgeInsets.only(top: 8.0),
                                      color: selectedIndex == index
                                          ? Color(0xFFF3B812)
                                          : Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 0.0,
                              ),
                          itemCount: 6),
                    ),
                  ),
                  //body
                  gridBuilder(
                    context: context,
                    itemCount: test[indexxxxxxxxx],
                    child: itemType[indexxxxxxxxx],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
