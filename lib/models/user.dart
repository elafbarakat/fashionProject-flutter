class User {
  int id;
  String name;
  String email;
  String phone;
  String password;
  bool state;
  DateTime timeCreate;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.state,
      required this.timeCreate});
}
