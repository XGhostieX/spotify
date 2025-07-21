import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/auth/create_user_req.dart';
import '../models/auth/signin_user_req.dart';
import '../models/song.dart';
import 'service_locator.dart';

class FirebaseService {
  Future<Either> register(CreateUserReq createUserReq) async {
    try {
      var user = await getIt<FirebaseAuth>().createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      getIt<FirebaseFirestore>().collection('users').add({
        'name': createUserReq.name,
        'email': user.user!.email,
      });
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
      if (e.code == 'invalid-credential') {
        return const Left('The Email or Password Provided is Incorrect');
      } else {
        return Left(e.message);
      }
    }
  }

  Future<Either> fetchSongs() async {
    try {
      var data = await getIt<FirebaseFirestore>()
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();
      List<Song> songs = [];
      for (var element in data.docs) {
        songs.add(Song.fromJson(element.data()));
      }
      return right(songs);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
