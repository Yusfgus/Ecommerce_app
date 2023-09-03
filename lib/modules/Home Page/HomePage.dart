import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:nemo_app/modules/Login%20Page/LoginScreen.dart';
import 'package:nemo_app/shared/Cubit/cubit.dart';
import 'package:nemo_app/shared/constants/constants.dart';
import '../../shared/Cubit/states.dart';
import '../../shared/components/components.dart';
import '../Details Page/DetailsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getInfo(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, index) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return ConditionalBuilder(
            condition:state is! GetDataLoadingState,
            builder: (BuildContext context) {return Scaffold(
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
                                    onPressed: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) => LoginScreen()));
                                    },
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
                                      onTap: () {
                                      },
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
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                               cubit.tapBarItemClicked(index);
                              },
                              child: Column(
                                children: [
                                  tapBarItem(
                                    label: cubit.categories[index],
                                    // width:
                                    //     categories[index] == 'Home Decoration'
                                    //         ? 120.0
                                    //         : 100.0,
                                    width: 8.5 * cubit.categories[index].length,
                                    coloor: cubit.selectedIndex == index
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  Container(
                                    width: 8.0 * cubit.categories[index].length,
                                    height: 4,
                                    margin: EdgeInsets.only(top: 8.0),
                                    decoration: BoxDecoration(
                                      color: cubit.selectedIndex == index
                                          ? Color(0xFFF3B812)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
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
                    SizedBox(
                      height: 20.0,
                    ),
                    //body
                     AnimationLimiter(
                      child: GridView.count(
                        shrinkWrap: true,
                        physics:
                        BouncingScrollPhysics(parent: NeverScrollableScrollPhysics()),
                        padding: EdgeInsets.all(screenWidth / 500),
                        crossAxisCount: 2,
                        children: List.generate(Manga[cubit.catIndex].length, (int index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: Duration(milliseconds: 1500),
                            columnCount: 2,
                            child: ScaleAnimation(
                              duration: Duration(milliseconds: 1200),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(
                                  child:  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) => DetailsPage(product: Manga[cubit.catIndex][index])));
                                    },
                                    child: itemBuilder(url: '${Manga[cubit.catIndex][index]['thumbnail']}',
                                      productName:  '${Manga[cubit.catIndex][index]['title']}',
                                      price: Manga[cubit.catIndex][index]['price'],
                                      discount:Manga[cubit.catIndex][index]['discountPercentage'],
                                    ),
                                  ),
                              ),
                            ),
                          );
                        },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );},
            fallback: (BuildContext context)=> Center(child: Lottie.asset('assets/loading.json')),
          );
        },
      ),
    );
  }
}
