
import '../dio_data_source.dart';

List<User> users = [];

Future<List<User>> getUsers() async {
  var response = await Source().getUsers();

  var userList = response.data['data'] as List;

  for(var x =0; x < userList.length; x++){
    users.add(User.fromJson(userList[x]));
  }
  return users;
}

createUser(String name, String jobAppliedFor) async {
  var response =
      await Source().createUser(name, jobAppliedFor);
  var user = response.data;

  return user;
 
}

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User(this.id, this.email, this.firstName, this.lastName, this.avatar);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        firstName = json["first_name"],
        lastName = json["last_name"],
        avatar = json["avatar"];
}
