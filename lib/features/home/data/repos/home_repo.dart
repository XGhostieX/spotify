import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either> fetchSongs();
}
