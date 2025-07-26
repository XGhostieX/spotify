import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/user.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> fetchUser() async {
    emit(ProfileLoading());
    var result = await getIt.get<ProfileRepo>().fetchUser();
    result.fold(
      (failure) => emit(ProfileFailure(failure)),
      (user) => emit(ProfileSuccess(user)),
    );
  }
}
