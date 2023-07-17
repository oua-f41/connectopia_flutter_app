import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectopia/features/following/domain/models/request/following_request.dart';
import 'package:connectopia/features/profile/data/repository/profile_repository.dart';
import 'package:connectopia/features/profile/domain/models/response/profile_response.dart';
import 'package:connectopia/product/di/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../product/models/core_models/message_room.dart';
import '../../../../product/models/core_models/user.dart' as ProjectUser;

import '../../../../app/base_cubit.dart';
import '../../../following/data/repository/following_repository.dart';
import 'view_model/profile_view_model.dart';

class ProfileCubit extends BaseCubit<ProfileViewModel> {
  ProfileCubit() : super(ProfileViewModel());

  late final IProfileRepository _profileRepository;
  late final IFollowingRepository _followingRepository;

  void init({required ProjectUser.User user}) async {
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      /* getIt.get<AppRouter>().replace(const MainLoginRoute()); */
      return;
    }
    _profileRepository = getIt.get<IProfileRepository>();
    _followingRepository = getIt.get<IFollowingRepository>();
    emit(state.copyWith(defaultUser: user));
    await getUserInit(user.id ?? "");
  }

  Future<void> getUserInit(String userId) async {
    emit(state.copyWith(isLoading: true));
    await getUser(userId);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> getUser(String userId) async {
    try {
      ProfileResponse? profile = await _profileRepository.getByUserId(userId);
      if (profile != null) {
        emit(state.copyWith(profileResponse: profile));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> follow() async {
    emit(state.copyWith(followingLoading: true));
    FollowingRequest request = FollowingRequest(
        followerId: FirebaseAuth.instance.currentUser!.uid,
        followeeId: state.profileResponse?.id ?? "");
    try {
      await _followingRepository.add(request);
      await refresh();
      try {
        final rooms =
            await FirebaseFirestore.instance.collection("rooms").get();
        final room = rooms.docs.firstWhere((a) {
          final data = a.data();
          return data['users']
                  .contains(FirebaseAuth.instance.currentUser!.uid) &&
              data['users'].contains(state.profileResponse!.id!);
        });
      } catch (e) {
        if (e is StateError) {
          if (e.message == "No element") {
            MessageRoom room = MessageRoom(users: [
              FirebaseAuth.instance.currentUser!.uid,
              state.profileResponse!.id!
            ], messages: []);
            await FirebaseFirestore.instance
                .collection("rooms")
                .add(room.toJson());
          }
        }
      }
    } catch (e) {
      print(e);
    }
    emit(state.copyWith(followingLoading: false));
  }

  Future<void> unfollow() async {
    emit(state.copyWith(followingLoading: true));
    String? followingId = state.profileResponse?.followers
        ?.firstWhere((element) =>
            element.followerId == FirebaseAuth.instance.currentUser!.uid)
        .id!;
    try {
      if (followingId != null) {
        await _followingRepository.delete(followingId);
        refresh();
      }
    } catch (e) {
      print(e);
    }
    emit(state.copyWith(followingLoading: false));
  }

  Future<void> refresh() async {
    await getUser(state.profileResponse?.id ?? "");
  }
}
