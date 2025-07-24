import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/home_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  void favorite(String id) async {
    var result = await getIt.get<HomeRepo>().favoriteSong(id);
    result.fold(
      (failure) => emit(FavoriteFailure(failure)),
      (isFavorite) => emit(FavoriteSuccess(isFavorite)),
    );
  }
}
