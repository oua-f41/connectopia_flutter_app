import 'package:connectopia/core/presentation/base_view_model.dart';

import '../../../../profile/domain/models/response/profile_response.dart';

class ChatViewModel extends BaseViewModel {
  String? message;
  String? roomId;
  ProfileResponse? ownUser;
  ProfileResponse? otherUser;

  ChatViewModel(
      {super.isLoading = false,
      this.message,
      this.roomId,
      this.ownUser,
      this.otherUser});

  ChatViewModel copyWith({
    bool? isLoading,
    String? message,
    String? roomId,
    ProfileResponse? ownUser,
    ProfileResponse? otherUser,
  }) {
    return ChatViewModel(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      roomId: roomId ?? this.roomId,
      ownUser: ownUser ?? this.ownUser,
      otherUser: otherUser ?? this.otherUser,
    );
  }

  @override
  List<Object?> get props => [isLoading, message, roomId, ownUser, otherUser];
}
