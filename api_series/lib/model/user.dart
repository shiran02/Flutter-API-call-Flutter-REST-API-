import 'package:api_series/model/user_dob.dart';
import 'package:api_series/model/user_location.dart';
import 'package:api_series/model/user_name.dart';

class User{
  late String gender;
  late String email;
  late String phone;
  late String cell;
  late UserName name;
  late UserDob dob;
  late UserLocation userLocation;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.name,
    required this.dob,
    required this.userLocation,
  });
  
}


