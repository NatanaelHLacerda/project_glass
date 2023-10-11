class FormBuilderValidator {
  static String? emailValidate(String? value){
    if (value == null || value.isEmpty){
      return 'Esse campo precisa ser preenchido';
    }
    return null;
  }

  static String? passwordValidate(String? value){
    if (value == null || value.isEmpty) {
      return 'Esse campo precisa ser preenchido';
    }
    return null;
  }
}