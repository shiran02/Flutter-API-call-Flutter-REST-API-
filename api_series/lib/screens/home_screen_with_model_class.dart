import 'dart:convert';

import 'package:api_series/model/user.dart';
import 'package:api_series/model/user_name.dart';
import 'package:api_series/services/user_api.dart';
import 'package:flutter/material.dart';


class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({super.key});

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {


  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

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
          final name = user.name.fullName();
          final dob = user.dob.date.toString();
          final street = user.userLocation.userStreet.name;
          final city = user.userLocation.city;
          final cordinate = user.userLocation.userCordinate.latitude;
          final timezone = user.userLocation.userTimeZone.offset;

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
                 Text('Name : ${name}',style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),),
                 Text('email : ${email}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                 Text('gender : ${gender}'.toString(),style: TextStyle(color: Colors.black,fontSize: 18),),
                 Text('phone : ${phone}'.toString(),style: TextStyle(color: Colors.black,fontSize: 18),),
                 Text('Cell : ${cell.toString()}',style: TextStyle(color: Colors.black,fontSize: 18),),
                 Text('street : ${street}',style: TextStyle(color: Colors.black,fontSize: 18),),
                 Text('city : ${city}',style: TextStyle(color: Colors.black,fontSize: 18),),
                 Text('state : ${dob.toString()}',style: TextStyle(color: Colors.black,fontSize: 18),),
                 Text('country : ${dob.toString()}',style: TextStyle(color: Colors.black,fontSize: 18),),
                 //Text('postcode : ${dob.toString()}',style: TextStyle(color: Colors.black,fontSize: 18),),
                 Text('coordinates : ${cordinate}',style: TextStyle(color: Colors.black,fontSize: 18),),
                 Text('timezone : ${timezone}',style: TextStyle(color: Colors.black,fontSize: 18),),
              ],
            ),
          );

        },
        ),
    );
  }



  Future<void> fetchData() async{
    final responce = await UserApi.fetchData();

    setState(() {
      users = responce;
    });
  }



}