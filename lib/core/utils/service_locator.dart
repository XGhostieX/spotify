import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import 'firebase_service.dart';

// import '../../features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseService>(FirebaseService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
  // getIt.registerSingleton<FirebaseService>(
  //   FirebaseService(firestore: getIt.get<FirebaseFirestore>()),
  // );
  // getIt.registerSingleton<HomeRepoImpl>(
  //   HomeRepoImpl(getIt.get<FirebaseService>()),
  // );
}
