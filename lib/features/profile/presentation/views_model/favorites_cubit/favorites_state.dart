part of 'favorites_cubit.dart';

sealed class FavoritesState {
  const FavoritesState();
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesSuccess extends FavoritesState {
  final List<Song> favorites;

  const FavoritesSuccess(this.favorites);
}

final class FavoritesFailure extends FavoritesState {
  final String errMsg;

  const FavoritesFailure(this.errMsg);
}
