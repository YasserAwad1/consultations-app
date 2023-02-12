import 'package:get_it/get_it.dart';

import 'package:consultation_project/common/local/local_repo.dart';
import 'package:consultation_project/main/settings/sevices/user_service.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerLazySingleton<LocalRepo>(() => LocalRepo());
  locator.registerLazySingleton<UserService>(() => UserService());
}
