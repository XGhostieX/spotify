part of 'songs_cubit.dart';

sealed class SongsState {
  const SongsState();
}

final class SongsInitial extends SongsState {}

final class SongsLoading extends SongsState {}

final class SongsSuccess extends SongsState {
  final List<Song> songs;

  const SongsSuccess(this.songs);
}

final class SongsFailure extends SongsState {
  final String errMsg;

  const SongsFailure(this.errMsg);
}
