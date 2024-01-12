import 'dart:convert';

import 'package:api_series/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({super.key});

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {


  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  / backgroundColor: Colors.green,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Api App'),
      ),

      body: ListView.builder(
        itemCount:users.length,
        itemBuilder: (context, index) {

          final user = users[index];

          final email =  user.email;
          final gender =  user.gender;
          final phone = user.phone;
          final cell = user.cell;
          final name = user.name.first;

          final color = gender == 'male' ? Colors.pink :  Colors.blue;

          return Container(
            decoration: BoxDecoration(
              color: color,
            ),
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(name,style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),),
                 Text(email,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                 Text(gender.toString(),style: TextStyle(color: Colors.black,fontSize: 18),),
                 Text(phone.toString(),style: TextStyle(color: Colors.black,fontSize: 18),),
                 Text(cell.toString(),style: TextStyle(color: Colors.black,fontSize: 18),),
              ],
            ),
          );

        },
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: fetchData
        ),
    );
  }


  Future<void> fetchData() async {
      
      const url = "https://randomuser.me/api/?results=20";

      final uri = Uri.parse(url);
      final response = await http.get(uri);

      final body  = response.body;

      final json = jsonDecode(body);

      final result = json['results'] as List<dynamic>;

      final transform = result.map((e){

        final nameObj = UserName(
          title: e['name']['title'], 
          first: e['name']['first'],
          last: e['name']['last']
        );



        return User(
          gender: e['gender'], 
          email: e['email'], 
          phone: e['phone'], 
          cell: e['cell'],
          name: nameObj,
          );
      }).toList();

      setState(() {
        users = transform;
      });

  }

}