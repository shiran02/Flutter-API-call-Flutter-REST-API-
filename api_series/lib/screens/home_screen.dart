import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<dynamic> users = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Rest Api Call'),
        
      ),

      body: ListView.builder(
        itemCount:users.length,
        itemBuilder: (context, index) {

          final user = users[index];

          final email =  user['email'];
          final age =  user['dob']['age'];
          final imageUrl = user['picture']['thumbnail'];

          return Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(email,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                Text(age.toString(),style: TextStyle(color: Colors.black),),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(imageUrl)
                  )
              ],
            ),
          );
        },
        ),

        
      floatingActionButton:  FloatingActionButton(
        onPressed:fetchUsers,
        child: Icon(Icons.refresh),
      ),
      
    );
  }

     fetchUsers() async{
            print('Fetch Data');

            const url = "https://randomuser.me/api/?results=5" ;
            final uri = Uri.parse(url);
            final response = await http.get(uri);
            final body = response.body;
            final json = jsonDecode(body);

            setState(() {
              users = json['results'];
            });

        
        //print(json['results']);
        print('fetch completed');
  }
}

