import 'package:todo_app/domain/models/common/result.dart';

/// 非同期処理に対して try-catch を行って builder パターンで  [Result] を返すクラス
class FutureResultBuilder {
  static Future<Result<T>> build<T>(Future<T> Function() function) async {
    try {
      final value = await function();
      return Result.success(value);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
