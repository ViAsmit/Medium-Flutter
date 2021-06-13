import 'package:medium_flutter/services/api_services.dart';
import 'package:medium_flutter/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerFactory(() => ApiService());
  // getIt.registerFactory(() => LogInViewModel());
  // getIt.registerFactory(() => WebsiteViewModel());
}
