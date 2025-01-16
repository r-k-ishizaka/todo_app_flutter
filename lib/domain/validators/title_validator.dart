import 'package:todo_app/domain/validators/validator.dart';

import '../models/common/validation_result.dart';

/// タイトルのバリデータ
class TitleValidator implements Validator {
  @override
  ValidationResult validate(String value) {
    if (value.isEmpty) {
      return ValidationResult.error('タイトルは必須です');
    }
    if (value.length > 50) {
      return ValidationResult.error('タイトルは50文字以内で入力してください');
    }
    return ValidationResult.success();
  }
}
