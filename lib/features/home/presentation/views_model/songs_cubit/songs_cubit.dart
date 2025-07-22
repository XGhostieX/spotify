import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/song.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/home_repo.dart';

part 'songs_state.dart';

class SongsCubit extends Cubit<SongsState> {
  SongsCubit() : super(SongsInitial());

  Future<void> fetchSongs() async {
    emit(SongsLoading());
    var result = await getIt.get<HomeRepo>().fetchSongs();
    result.fold(
      (failure) => emit(SongsFailure(failure)),
      (songs) => emit(SongsSuccess(songs)),
    );
  }
}
