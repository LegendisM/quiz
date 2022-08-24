import 'dart:convert';

String getPrettyJSONString(jsonObject) {
  const encoder = JsonEncoder.withIndent("     ");
  return encoder.convert(jsonObject);
}

Map convertStringToMap(String content) {
  return const JsonDecoder().convert(content);
}
