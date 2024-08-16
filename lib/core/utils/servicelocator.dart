import 'package:bookly/core/utils/ApiService.dart';
import 'package:bookly/features/home/data/Repos/homeRepoImolementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setup() {
  getit.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  getit.registerSingleton<Homerepoimolementation>(
      Homerepoimolementation(getit.get<ApiService>()));
}
