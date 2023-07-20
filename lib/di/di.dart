import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../data/network/api_service.dart';
import '../data/network/dio_client.dart';
import '../data/repository/home_repository.dart';
import '../domain/repository/home_repository.dart';

final instance = GetIt.instance;

/*initHomeModule() {
  if (!GetIt.I.isRegistered<HomeViewViewModel>()) {
    instance.registerFactory<HomeViewViewModel>(() => HomeViewViewModel());
  }
}*/

initDio() {
  instance.registerSingleton(Dio());
  instance.registerSingleton(DioClient(instance<Dio>()));
  instance.registerFactory<ApiService>(() => ApiService(dioClient: instance()));
  instance.registerFactory<HomeRepository>(
      () => HomeRepositoryImp(instance()));
}

resetModules() {
  instance.reset(dispose: false);
  /*initHomeModule();*/
}
