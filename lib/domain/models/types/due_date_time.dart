/// 締切日時の型
extension type DueDateTime(DateTime dateTime) {
  /// 締切日時のフォーマット済み文字列を返す
  String formattedString() {
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  }

  /// 締切日時のISO8601文字列を返す
  toIso8601String() {
    return dateTime.toIso8601String();
  }

  /// ISO8601文字列から締切日時を生成する
  static fromIso8601String(map) {
    return DueDateTime(DateTime.parse(map));
  }
}
