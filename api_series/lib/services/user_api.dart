import 'dart:convert';

import 'package:api_series/model/user.dart';
import 'package:api_series/model/user_dob.dart';
import 'package:api_series/model/user_location.dart';
import 'package:api_series/model/user_name.dart';
import 'package:http/http.dart' as http;

class UserApi{

 static Future<List<User>> fetchData() async {
      
      const url = "https://randomuser.me/api/?results=20";

      final uri = Uri.parse(url);
      final response = await http.get(uri);

      final body  = response.body;

      final json = jsonDecode(body);

      final result = json['results'] as List<dynamic>;

      final users = result.map((e){

        final nameObj = UserName(
          title: e['name']['title'], 
          first: e['name']['first'],
          last: e['name']['last']
        );

        final dobObj = UserDob(
          date: e['dob']['date'], 
          age: e['dob']['age'], 
        );

        

          final userStreetObj = UserStreet(
            number: e['location']['street']['number'].toString(),
            name: e['location']['street']['name'],
          );
          
          final userTimeZoneObj = UserTimeZone(
            offset:e['location']['timezone']['offset'],
            description:e['location']['timezone']['description'],
          );

         final userCordinateObj = UserCordinate(
            latitude: e['location']['coordinates']['latitude'],
            longitude: e['location']['coordinates']['longitude'],
          );

          final userLocation = UserLocation(
          city: e['location']['city'], 
          state: e['location']['state'], 
          country: e['location']['country'], 
      //    postcode: e['location']['postcode'],
          userCordinate: userCordinateObj, 
          userStreet: userStreetObj,
          userTimeZone: userTimeZoneObj
          
          );





        return User(
          gender: e['gender'], 
          email: e['email'], 
          phone: e['phone'], 
          cell: e['cell'],
          name: nameObj,
          dob: dobObj,
          userLocation: userLocation,
          );
      }).toList();

        return users;
    

  }
}