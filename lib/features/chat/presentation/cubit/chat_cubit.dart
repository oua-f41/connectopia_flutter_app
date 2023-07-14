import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectopia/features/chat/presentation/cubit/view_model/chat_view_model.dart';
import 'package:connectopia/features/notification/data/repository/notification_repository.dart';
import 'package:connectopia/features/profile/data/repository/profile_repository.dart';
import 'package:connectopia/product/di/injection.dart';
import 'package:connectopia/product/models/core_models/message.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../app/base_cubit.dart';
import '../../../notification/domain/models/request/notification_request.dart';

class ChatCubit extends BaseCubit<ChatViewModel> {
  ChatCubit() : super(ChatViewModel());

  late final IProfileRepository _userRepository;
  late final INotificationRepository _notificationRepository;

  init(String userId) async {
    _userRepository = getIt.get<IProfileRepository>();
    _notificationRepository = getIt.get<INotificationRepository>();
    await initRoom(userId);
    await initProfiles(userId);
  }

  Future<void> initRoom(String userId) async {
    final rooms = await FirebaseFirestore.instance.collection("rooms").get();
    final roomId = rooms.docs.firstWhere((a) {
      final data = a.data();
      return data['users'].contains(FirebaseAuth.instance.currentUser!.uid) &&
          data['users'].contains(userId);
    }).id;
    emit(state.copyWith(roomId: roomId));
  }

  Future<void> initProfiles(String userId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final otherUser = await _userRepository.getByUserId(userId);
      emit(state.copyWith(otherUser: otherUser));
      final ownUser = await _userRepository
          .getByUserId(FirebaseAuth.instance.currentUser!.uid);
      emit(state.copyWith(ownUser: ownUser));
    } catch (e) {
      print(e);
    }
    emit(state.copyWith(isLoading: false));
  }

  void onMessageChanged(String value) {
    emit(state.copyWith(message: value));
    print(state.message);
  }

  void onMessageSend() async {
    if (state.message == "" || state.isLoading) return;
    FirebaseFirestore.instance.collection("rooms").doc(state.roomId).update({
      "messages": FieldValue.arrayUnion([
        Message(
                content: state.message,
                senderId: FirebaseAuth.instance.currentUser!.uid,
                createdAt: DateTime.now().toIso8601String())
            .toJson()
      ])
    });
    await _notificationRepository.sendMessage(NotificationRequest(
      id: state.otherUser?.id ?? "",
      title: state.ownUser?.userName ?? "",
      body: state.message ?? "",
    ));
    emit(state.copyWith(message: ""));
  }
}
