import 'dart:convert';
import 'package:http/http.dart' as http;
import 'usuario.dart';


Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body);
    return userJson.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
} 

void filterUsersByUsername(List<User> users) {
  final filteredUsers = users.where((user) => user.username.length > 6).toList();
  print('Usuarios con más de 6 caracteres: ');
  for (var user in filteredUsers) {
    print('${user.name} - ${user.username}');
  }
}

void countEmailsWithBizDomain(List<User> users) {
  final bizUsersCount = users.where((user) => user.email.endsWith('.biz')).length;
  print('Cantidad de usuarios con correo de dominio "biz": $bizUsersCount');
}
