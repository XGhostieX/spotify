import 'package:dartz/dartz.dart';
import 'package:spotify/core/utils/firebase_service.dart';

import '../../../../core/utils/service_locator.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either> fetchSongs() async {
    return await getIt.get<FirebaseService>().fetchSongs();
  }
}
