import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either> fetchUser();
}
