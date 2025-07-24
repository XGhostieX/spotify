import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either> fetchSongs();
  Future<Either> favoriteSong(String id);
  Future<bool> isFavorite(String id);
}
