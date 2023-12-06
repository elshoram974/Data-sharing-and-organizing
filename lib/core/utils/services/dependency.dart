import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


final GetIt getIt = GetIt.instance;
late final SharedPreferences pref ;

Future<void> sharedPref() async{
  pref = await SharedPreferences.getInstance();
}

void getItSingleton() {
  // getIt.registerSingleton<HomeRepositoriesImp>(
  //   HomeRepositoriesImp(
  //     localDataSource: HomeLocalDataSourceImp(),
  //     remoteDataSource: HomeRemoteDataSourceImp(APIServices(Dio())),
  //   ),
  // );
  SharedPreferences.getInstance();
  // getIt.registerSingleton<>(
  // );
}