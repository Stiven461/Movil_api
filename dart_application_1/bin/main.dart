import 'package:dart_application_1/funciones.dart';
import 'package:dart_application_1/usuario.dart';

void main() async {
  try {
    // Obtener usuarios de la API
    List<User> users = await fetchUsers();

    // Filtrar usuarios por longitud del nombre de usuario
    filterUsersByUsername(users);

    // Contar usuarios con email en el dominio '.biz'
    countEmailsWithBizDomain(users);
  } catch (e) {
    print('Error: $e');
  }
}
