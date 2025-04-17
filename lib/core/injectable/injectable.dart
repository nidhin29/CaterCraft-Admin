import 'package:get_it/get_it.dart';
import 'package:catering/core/injectable/injectable.config.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;
@InjectableInit()
Future<void> configureInjection(String env) async {
  GetItInjectableX(getIt).init(environment: env);
}
