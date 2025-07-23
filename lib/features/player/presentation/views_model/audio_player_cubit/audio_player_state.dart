part of 'audio_player_cubit.dart';

sealed class AudioPlayerState {
  const AudioPlayerState();
}

final class AudioPlayerInitial extends AudioPlayerState {}

final class AudioPlayerLoading extends AudioPlayerState {}

final class AudioPlayerSuccess extends AudioPlayerState {}

final class AudioPlayerFailure extends AudioPlayerState {
  final String errMsg;

  const AudioPlayerFailure(this.errMsg);
}
