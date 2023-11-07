abstract interface class IAuthRepository {
  Future<void> login(String username, String password);
}
