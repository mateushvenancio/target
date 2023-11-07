class MainException implements Exception {
  final String? _message;
  MainException([this._message]);

  String get message => _message ?? 'Ocorreu um erro';

  @override
  String toString() => message;
}
