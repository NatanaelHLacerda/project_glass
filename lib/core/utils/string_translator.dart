class StringTranslator {
  static build(String value) {
    if (value ==
        '[firebase_auth/INVALID_LOGIN_CREDENTIALS] An internal error has occurred. [ INVALID_LOGIN_CREDENTIALS ]') {
      return 'Dados fornecidos inválidos.';
    } else if (value ==
        '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.') {
      return 'Muitas tentativas, tente novamente mais tarde!';
    } else if (value ==
        '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
      return 'O email escolhido já está em uso.';
    }
    return 'Falha na conexão.';
  }
}
