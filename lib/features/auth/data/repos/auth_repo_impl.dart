import 'package:dartz/dartz.dart';
import 'package:spotify/core/utils/firebase_service.dart';

import '../../../../core/models/auth/create_user_req.dart';
import '../../../../core/models/auth/signin_user_req.dart';
import '../../../../core/utils/service_locator.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either> register(CreateUserReq createUserReq) async {
    return await getIt<FirebaseService>().register(createUserReq);
  }

  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await getIt<FirebaseService>().signin(signinUserReq);
  }
}
