import 'package:get_it/get_it.dart';
import 'package:build_an_app_in_flutter_workshop/src/core/services/services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => PostService());
}
