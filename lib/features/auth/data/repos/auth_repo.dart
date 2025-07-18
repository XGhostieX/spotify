import 'package:dartz/dartz.dart';

import '../../../../core/models/auth/create_user_req.dart';

abstract class AuthRepo {
  Future<Either> register(CreateUserReq createUserReq);
  Future<void> signin();
}
