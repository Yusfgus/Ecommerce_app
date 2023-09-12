import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../modules/Login Page/LoginScreen.dart';
import '../../sqflite/sqflite.dart';

Sqflite sqlDb = Sqflite();
List<List<dynamic>> Manga = [];
List<Map<String, dynamic>> Data = [];
List<int> userFavourites = [];
List<int> userCart = [];
late final AppProducts;
late Map<String, dynamic> myProduct;
late User user;
String username = "";

var userController = TextEditingController();
var passController = TextEditingController();
// final user = FirebaseAuth.instance.currentUser!;
double totalPrice = 0;

ReadData() async {
  print("start reading");
  Data = await sqlDb.getUserData();
  print("print user $username Data: $Data");
  userFavourites = stringToList(Data[0]['fav']);
  userCart = stringToList(Data[0]['cart']);
  print("finish reading");
}

List<int> stringToList(String input) {
  List<String> parts = input.split('|');
  List<int> result =[];

  for (String part in parts) {
    if (part.isNotEmpty) {
      int? value = int.tryParse(part);
      if (value != null) {
        result.add(value);
      }
    }
  }

  return result;
}

String listToString(List<int> myList)
{
  print("====================================================================");
  String s = "";
  print("myList: $myList");
  for(int i=0; i<myList.length; ++i){
    print(i);
    s += myList[i].toString() + '|';
  }
  print("new List: $s");
  return s;
}


void showAlertDialog({
  required BuildContext context,
  required String label,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: AlertDialog(
          title: Text('Warning'),
          content: Text(label),
          actions: [
            Center(
              child: Container(
                width: 120.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFF005C6C),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ok',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

enum Direction { vertical, horizontal }

class SlideFadeTransition extends StatefulWidget {
  final Widget child;

  final double offset;

  final Curve curve;

  final Direction direction;

  final Duration delayStart;

  final Duration animationDuration;

  SlideFadeTransition({
    required this.child,
    this.offset = 1.0,
    this.curve = Curves.easeIn,
    this.direction = Direction.vertical,
    this.delayStart = const Duration(seconds: 0),
    this.animationDuration = const Duration(milliseconds: 800),
  });

  @override
  _SlideFadeTransitionState createState() => _SlideFadeTransitionState();
}

class _SlideFadeTransitionState extends State<SlideFadeTransition>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animationSlide;

  late AnimationController _animationController;

  late Animation<double> _animationFade;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    if (widget.direction == Direction.vertical) {
      _animationSlide =
          Tween<Offset>(begin: Offset(0, widget.offset), end: Offset(0, 0))
              .animate(CurvedAnimation(
        curve: widget.curve,
        parent: _animationController,
      ));
    } else {
      _animationSlide =
          Tween<Offset>(begin: Offset(widget.offset, 0), end: Offset(0, 0))
              .animate(CurvedAnimation(
        curve: widget.curve,
        parent: _animationController,
      ));
    }

    _animationFade =
        Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(
      curve: widget.curve,
      parent: _animationController,
    ));

    Timer(widget.delayStart, () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationFade,
      child: SlideTransition(
        position: _animationSlide,
        child: widget.child,
      ),
    );
  }
}

// Api request
Future<dynamic> getData() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));
  if (response.statusCode == 200) {
    final decodedResponse = json.decode(response.body);
    AppProducts = decodedResponse['products'];

    Manga = [
      AppProducts
          .where((product) => product['category'] == 'smartphones')
          .toList(),
      AppProducts.where((product) => product['category'] == 'laptops').toList(),
      AppProducts
          .where((product) => product['category'] == 'home-decoration')
          .toList(),
      AppProducts.where((product) => product['category'] == 'skincare').toList(),
      AppProducts.where((product) => product['category'] == 'fragrances').toList(),
      AppProducts.where((product) => product['category'] == 'groceries').toList(),
    ];
    return Manga;
  } else {
    print('Failed to fetch data');
  }
}
