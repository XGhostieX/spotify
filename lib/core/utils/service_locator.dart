import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import 'firebase_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseService>(FirebaseService());
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl());
}
