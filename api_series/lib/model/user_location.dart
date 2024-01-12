class UserLocation{
  final String city; 
  final String state; 
  final String country; 
//  final int postcode;
  final UserStreet userStreet;
  final UserTimeZone userTimeZone;
  final UserCordinate userCordinate;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
   // required this.postcode,
    required this.userStreet,
    required this.userTimeZone,
    required this.userCordinate,
  });
}


class UserStreet{
  final String number; 
  final String name;
  UserStreet({
    required this.number,
    required this.name,
  });
}

class UserTimeZone{
  final String offset;
  final String description;
  UserTimeZone({
    required this.offset,
    required this.description,
  });
}

class UserCordinate{
  final String latitude;
  final String longitude;
  UserCordinate({
    required this.latitude,
    required this.longitude,
  });
}