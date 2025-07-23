import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  AudioPlayerCubit() : super(AudioPlayerInitial()) {
    audioPlayer.positionStream.listen((event) {
      position = event;
      emit(AudioPlayerSuccess());
    });

    audioPlayer.durationStream.listen((event) => duration = event!);
  }

  Future<void> load(String url) async {
    emit(AudioPlayerLoading());
    try {
      await audioPlayer.setUrl(url);
      emit(AudioPlayerSuccess());
    } catch (e) {
      emit(AudioPlayerFailure(e.toString()));
    }
  }

  void check() {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
