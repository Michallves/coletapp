// ignore_for_file: valid_regexps, non_constant_identifier_names

// ignore: depend_on_referenced_packages
import 'package:brasil_fields/brasil_fields.dart';

class Validators {
  static String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }

  static String? isNotEmpty(String? value) {
    if (value == null || value.isEmpty || value == '') {
      return "Este campo é obrigatório!";
    }
    return null;
  }

  static String? isNotSelected(String? value) {
    if (value == "" || value == null) {
      return "Este campo é obrigatório!";
    }
    return null;
  }

}