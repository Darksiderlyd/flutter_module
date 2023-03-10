class TextUtil {
  /// isEmpty
  static bool isEmpty(String text) {
    return text.isEmpty;
  }

  /// 每隔 x位 加 pattern
  static String formatDigitPattern(String? text, {int digit = 4, String pattern = ' '}) {
    if (text == null) return '';

    text = text.replaceAllMapped(RegExp("(.{$digit})"), (Match match) {
      return "${match.group(0)}$pattern";
    });
    if (text.endsWith(pattern)) {
      text = text.substring(0, text.length - 1);
    }
    return text;
  }

  /// 每隔 x位 加 pattern, 从末尾开始
  static String formatDigitPatternEnd(String? text, {int digit = 4, String pattern = ' '}) {
    if (text == null) return '';
    String temp = reverse(text);
    temp = formatDigitPattern(temp, digit: 3, pattern: pattern);
    temp = reverse(temp);
    return temp;
  }

  /// 每隔4位加空格
  static String formatSpace4(String? text) {
    if (text == null) return '';
    return formatDigitPattern(text);
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。int型。
  static String formatComma3(Object? num) {
    if (num == null) return '';
    return formatDigitPatternEnd(num.toString(), digit: 3, pattern: ',');
  }

  /// hideNumber
  static String hideNumber(String? phoneNo,
      {int start = 3, int end = 7, String replacement = '****'}) {
    if (phoneNo == null) return '';
    return phoneNo.replaceRange(start, end, replacement);
  }

  /// replace
  static String replace(String? text, Pattern from, String replace) {
    if (text == null) return '';
    return text.replaceAll(from, replace);
  }

  /// split
  static List<String> split(String? text, Pattern pattern, {List<String> defValue = const []}) {
    if (text == null) return defValue;
    List<String> list = text.split(pattern);
    return list ?? defValue;
  }

  /// reverse
  static String reverse(String? text) {
    if (text == null) return '';
    StringBuffer sb = StringBuffer();
    for (int i = text.length - 1; i >= 0; i--) {
      sb.writeCharCode(text.codeUnitAt(i));
    }
    return sb.toString();
  }
}