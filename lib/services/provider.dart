import 'package:tourist/services/static_provider.dart';

import 'data_provider.dart';

class Provider {
  static DataProvider provider = StaticProvider();

  static String getQR(url) {
    return provider.getString(url);
  }
}
