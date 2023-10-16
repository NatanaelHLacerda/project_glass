import 'package:string_validator/string_validator.dart' as validator;

class FormBuilderValidator {
  static String? emailValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Esse campo precisa ser preenchido';
    } else if (!validator.isEmail(value)) {
      return 'Digite um formato de e-mail válido';
    }
    return null;
  }

  static String? passwordValidate(String? value){
    if (value == null || value.isEmpty) {
      return 'Esse campo precisa ser preenchido';
    } else if (value.length < 8 ) {
      return 'A senha precisa ser maior do que 8 dígitos.';
    }
    return null;
  }
}