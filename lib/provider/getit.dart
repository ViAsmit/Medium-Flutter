import 'package:medium_flutter/services/api_services.dart';
import 'package:medium_flutter/services/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:medium_flutter/view/login_viewmodel.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerFactory(() => ApiService());
  getIt.registerFactory(() => LoginViewModel());
  // getIt.registerFactory(() => WebsiteViewModel());
}
