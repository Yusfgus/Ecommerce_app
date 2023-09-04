import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../modules/Login Page/LoginScreen.dart';

late Map<String, dynamic> myProduct;
List<List<dynamic>> Manga = [];
var userController = TextEditingController();
var passController = TextEditingController();
// final user = FirebaseAuth.instance.currentUser!;
late User user;
String username = "";

// List<dynamic> smartPhonesList = [];
// List<dynamic> laptopsList = [];
// List<dynamic> homeDecList = [];
// List<dynamic> skincareList = [];
// List<dynamic> fragrancesList = [];
// List<dynamic> groceriesList = [];

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
    final products = decodedResponse['products'];

    Manga = [
      products
          .where((product) => product['category'] == 'smartphones')
          .toList(),
      products.where((product) => product['category'] == 'laptops').toList(),
      products
          .where((product) => product['category'] == 'home-decoration')
          .toList(),
      products.where((product) => product['category'] == 'skincare').toList(),
      products.where((product) => product['category'] == 'fragrances').toList(),
      products.where((product) => product['category'] == 'groceries').toList(),
    ];
    return Manga;
  } else {
    print('Failed to fetch data');
  }
}
