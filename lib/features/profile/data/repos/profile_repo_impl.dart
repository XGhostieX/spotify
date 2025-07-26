import 'package:dartz/dartz.dart';

import '../../../../core/utils/firebase_service.dart';
import '../../../../core/utils/service_locator.dart';
import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<Either> fetchUser() async {
    return await getIt.get<FirebaseService>().fetchUser();
  }
}
