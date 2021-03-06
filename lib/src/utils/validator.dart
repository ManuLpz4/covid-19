class Validator {
  static String validateUsername(String value) {
    const String pattern = '^\\w{3,}\$';
    if (value.isEmpty) {
      return 'Ingresá un usuario';
    }
    if (!RegExp(pattern).hasMatch(value)) {
      return 'Ingresá un usuario válido';
    }
    return null;
  }

  static String validateEmail(String value) {
    const String pattern =
        '^[a-zA-Z0-9.!#\$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\$';
    if (value.isEmpty) {
      return 'Ingresá un correo electrónico';
    }
    if (!RegExp(pattern).hasMatch(value)) {
      return 'Ingresá un correo electrónico válido';
    }
    return null;
  }

  static String validatePassword(String value) {
    const String pattern = '^\\w{1,10}\$';
    if (value.isEmpty) {
      return 'Ingresá una contraseña';
    }
    if (!RegExp(pattern).hasMatch(value)) {
      return 'Ingresá una contraseña válida';
    }
    return null;
  }
}
