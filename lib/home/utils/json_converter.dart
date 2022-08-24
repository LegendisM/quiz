import 'dart:convert';

String getPrettyJSONString(jsonObject) {
  const encoder = JsonEncoder.withIndent("     ");
  return encoder.convert(jsonObject);
}
