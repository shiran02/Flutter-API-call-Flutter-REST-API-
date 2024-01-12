class User{
  late String gender;
  late String email;
  late String phone;
  late String cell;
  late UserName name;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.name,
  });
  
}


class UserName{
  late String title;
  late String first;
  late String last;

  UserName({
    required this.title,
    required this.first,
    required this.last,
  });
}