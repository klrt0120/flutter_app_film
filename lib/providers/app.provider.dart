import 'package:motchill/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'authenciation_provider.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AuthenciationNotifier()),
    ChangeNotifierProvider(create: (_) => MovieProvide())
  ];
}
