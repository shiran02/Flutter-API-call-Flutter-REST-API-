class UserName{
  late String title;
  late String first;
  late String last;

  UserName({
    required this.title,
    required this.first,
    required this.last,
  });

  String fullName(){
    return '${title} ${first} ${last}';
  }
}