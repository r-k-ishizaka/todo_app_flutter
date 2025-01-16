import '../models/common/validation_result.dart';

/// バリデータの interface
abstract interface class Validator {
  /// バリデーションを行う
  ValidationResult validate(String value);
}
