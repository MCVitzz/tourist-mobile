import 'package:tourist/services/data_provider.dart';

class StaticProvider extends DataProvider {
  String getString(url) {
    if (url == 'Testes') {
      return 'blue';
    } else if (url == 'Economia') {
      return 'red';
    } else {
      return 'amber';
    }
  }
}
