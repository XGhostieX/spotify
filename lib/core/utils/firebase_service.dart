import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/auth/create_user_req.dart';
import '../models/auth/signin_user_req.dart';
import 'service_locator.dart';

class FirebaseService {
  Future<Either> register(CreateUserReq createUserReq) async {
    try {
      await getIt<FirebaseAuth>().createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return const Right('Register Was Successfull');
    } on FirebaseAuthException catch (e) {
      return Left(e.message);
    }
  }

  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await getIt<FirebaseAuth>().signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return const Right('Sign In Was Successfull');
    } on FirebaseAuthException catch (e) {
      return Left(e.message);
    }
  }
}
