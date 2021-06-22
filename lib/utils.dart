class Utils {
  static String doubleToString(n) {
    if (n > 1000000) {
      double simple = n / 1000;
      return simple.toString().substring(0, 3).replaceAll('.0', '') + 'M';
    } else if (n > 1000) {
      double simple = n / 1000;
      return simple.toString().substring(0, 3).replaceAll('.0', '') + 'k';
    } else
      return n.toString();
  }
}
