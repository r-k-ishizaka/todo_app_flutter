import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_result.freezed.dart';

/// バリデーションの結果
@freezed
sealed class ValidationResult with _$ValidationResult {
  /// バリデーション成功
  const factory ValidationResult.success() = ValidationSuccess;

  /// バリデーションエラー
  const factory ValidationResult.error(String message) = ValidationError;
}

/// バリデーションの結果拡張
extension ValidationResultExtension on ValidationResult {
  /// バリデーション成功かどうか
  bool get isValid => this is ValidationSuccess;

  /// バリデーションエラーかどうか
  bool get isError => this is ValidationError;
}
