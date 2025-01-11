/// 締切日時の型
extension type DueDateTime(DateTime dateTime) {
  /// 締切日時のフォーマット済み文字列を返す
  String formattedString() {
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  }
}