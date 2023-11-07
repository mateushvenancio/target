import 'package:target/core/exceptions/main_exception.dart';
import 'package:target/repositories/i_auth_repository.dart';

class MockAuthRepository implements IAuthRepository {
  @override
  Future<void> login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      throw MainException('Preencha todos os campos');
    }

    final errors = <String>[];

    if (password.length < 2) {
      errors.add('Senha não pode ter menos que dois caracteres');
    }

    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(password)) {
      errors.add('Não são permitidos caracteres especiais na senha. Apenas letras e números.');
    }

    if (username.length > 20) {
      errors.add('Usuário não pode ter mais que 20 caracteres');
    }

    if (password.length > 20) {
      errors.add('Senha não pode ter mais que 20 caracteres');
    }

    if (errors.isNotEmpty) {
      final errorMessage = errors.map((e) => '- $e').join('\n');
      throw MainException(errorMessage);
    }
  }
}
