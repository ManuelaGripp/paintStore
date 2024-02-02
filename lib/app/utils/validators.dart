import 'package:flutter/material.dart';

abstract class Validator {
  static FormFieldValidator<String> multiple(
      List<FormFieldValidator<String>> values) {
    return (value) {
      for (var validator in values) {
        var result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  static FormFieldValidator<String> required({String? message}) {
    return (value) {
      if (value?.isEmpty ?? true) {
        return message ?? 'Campo obrigatório';
      }
      return null;
    };
  }

  static FormFieldValidator<String> min(String? message, num min) {
    return (value) {
      if (value?.isEmpty ?? true) {
        return null;
      } else {
        if ((value?.length ?? 0) < min) {
          return message;
        } else {
          return null;
        }
      }
    };
  }
}
