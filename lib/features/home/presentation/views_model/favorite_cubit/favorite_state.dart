part of 'favorite_cubit.dart';

sealed class FavoriteState {
  const FavoriteState();
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final bool isFavorite;

  FavoriteSuccess(this.isFavorite);
}

final class FavoriteFailure extends FavoriteState {
  final String errMsg;

  const FavoriteFailure(this.errMsg);
}
