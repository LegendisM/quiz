Map calculateMultiplication(int maxNumber) {
  Map result = {};

  for (int i = 1; i <= maxNumber; i++) {
    result[i] = {};
    for (int i2 = 1; i2 <= 10; i2++) {
      result[i]["$i * $i2"] = i * i2;
    }
  }
  return result;
}
