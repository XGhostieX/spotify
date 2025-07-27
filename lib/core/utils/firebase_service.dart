import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

import '../../features/home/data/repos/home_repo.dart';
import '../models/auth/create_user_req.dart';
import '../models/auth/signin_user_req.dart';
import '../models/song.dart';
import '../models/user.dart';
import 'service_locator.dart';

class FirebaseService {
  Future<Either> register(CreateUserReq createUserReq) async {
    try {
      var user = await getIt<FirebaseAuth>().createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      getIt<FirebaseFirestore>().collection('users').doc(user.user!.uid).set({
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
          .get();
      List<Song> songs = [];
      for (var element in data.docs) {
        var song = Song.fromJson(element.data());
        bool isFavorite = await getIt<HomeRepo>().isFavorite(
          element.reference.id,
        );
        song.isFavorite = isFavorite;
        songs.add(song);
      }
      return right(songs);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either> favoriteSong(String id) async {
    try {
      var favorite = await getIt<FirebaseFirestore>()
          .collection('users')
          .doc(getIt<FirebaseAuth>().currentUser!.uid)
          .collection('favorites')
          .where('id', isEqualTo: id)
          .get();
      if (favorite.docs.isNotEmpty) {
        await favorite.docs.first.reference.delete();
        return right(false);
      } else {
        await getIt<FirebaseFirestore>()
            .collection('users')
            .doc(getIt<FirebaseAuth>().currentUser!.uid)
            .collection('favorites')
            .add({'id': id, 'date': Timestamp.now()});
        return right(true);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<bool> isFavorite(String id) async {
    try {
      var favorite = await getIt<FirebaseFirestore>()
          .collection('users')
          .doc(getIt<FirebaseAuth>().currentUser!.uid)
          .collection('favorites')
          .where('id', isEqualTo: id)
          .get();
      if (favorite.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<Either> fetchUser() async {
    try {
      var userData = await getIt<FirebaseFirestore>()
          .collection('users')
          .doc(getIt<FirebaseAuth>().currentUser!.uid)
          .get();
      User user = User.fromJson(userData.data()!);
      return right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either> fetchFavoriteSongs() async {
    try {
      var favoriteData = await getIt<FirebaseFirestore>()
          .collection('users')
          .doc(getIt<FirebaseAuth>().currentUser!.uid)
          .collection('favorites')
          .get();
      List<Song> songs = [];
      for (var element in favoriteData.docs) {
        var data = await getIt<FirebaseFirestore>()
            .collection('songs')
            .doc(element['id'])
            .get();
        var song = Song.fromJson(data.data()!);
        bool isFavorite = await getIt<HomeRepo>().isFavorite(data.reference.id);
        song.isFavorite = isFavorite;
        songs.add(song);
      }
      return right(songs);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
