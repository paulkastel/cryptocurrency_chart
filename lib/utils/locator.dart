import 'package:cryptochart/cubits/chart/chart_cubit.dart';
import 'package:cryptochart/network/crypto_rest_api.dart';
import 'package:cryptochart/network/http_client.dart';
import 'package:cryptochart/repositories/crypto_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  _setupApi();
  _setupRepository();
  _setupCubits();
}

GetIt _setupApi() {
  return locator..registerFactory(() => CryptoRestApi(httpClient));
}

GetIt _setupRepository() {
  return locator..registerFactory(() => CryptoRepository(locator.get<CryptoRestApi>()));
}

GetIt _setupCubits() {
  return locator..registerFactory(() => ChartCubit(locator.get<CryptoRepository>()));
}
