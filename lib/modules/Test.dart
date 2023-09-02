import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('API Test'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Fetch Data'),
            onPressed: () {
              fetchData();
            },
          ),
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    // Make API request
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
      headers: {'Accept': 'Ecommerce/json'},
    );

    // Parse JSON response
    final jsonData = json.decode(response.body);
    print(jsonData);
  }
}