import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectopia/features/chat/presentation/cubit/view_model/chat_view_model.dart';
import 'package:connectopia/product/models/core_models/message.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../app/base_cubit.dart';

class ChatCubit extends BaseCubit<ChatViewModel> {
  ChatCubit() : super(ChatViewModel());

  init(String userId) async {
    final rooms = await FirebaseFirestore.instance.collection("rooms").get();
    final roomId = rooms.docs.firstWhere((a) {
      final data = a.data();
      return data['users'].contains(FirebaseAuth.instance.currentUser!.uid) &&
          data['users'].contains(userId);
    }).id;
    emit(state.copyWith(roomId: roomId));
  }

  void onMessageChanged(String value) {
    emit(state.copyWith(message: value));
    print(state.message);
  }

  void onMessageSend() {
    if (state.message == "") return;
    FirebaseFirestore.instance.collection("rooms").doc(state.roomId).update({
      "messages": FieldValue.arrayUnion([
        Message(
                content: state.message,
                senderId: FirebaseAuth.instance.currentUser!.uid,
                createdAt: DateTime.now().toIso8601String())
            .toJson()
      ])
    });
    emit(state.copyWith(message: ""));
  }
}
