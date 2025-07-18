import 'package:dartz/dartz.dart';

import '../../../../core/models/auth/create_user_req.dart';
import '../../../../core/models/auth/signin_user_req.dart';

abstract class AuthRepo {
  Future<Either> register(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
}
