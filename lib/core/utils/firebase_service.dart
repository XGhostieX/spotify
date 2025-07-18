import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/auth/create_user_req.dart';

class FirebaseService {
  Future<Either> register(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return const Right('Register Was Successfull');
    } on FirebaseAuthException catch (e) {
      return Left(e.message);
    }
  }

  Future<void> signin() async {
    // ignore: avoid_print
    print('Sign In');
  }
}
