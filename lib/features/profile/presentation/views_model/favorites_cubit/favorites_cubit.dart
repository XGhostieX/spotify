import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/song.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/profile_repo.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  Future<void> fetchFavoriteSongs() async {
    emit(FavoritesLoading());
    var result = await getIt.get<ProfileRepo>().fetchFavoriteSongs();
    result.fold(
      (failure) => emit(FavoritesFailure(failure)),
      (favorites) => emit(FavoritesSuccess(favorites)),
    );
  }
}
