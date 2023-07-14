import 'package:connectopia/core/presentation/base_view_model.dart';

class ChatViewModel extends BaseViewModel {
  String? message;
  String? roomId;

  ChatViewModel({this.message, this.roomId});

  ChatViewModel copyWith({
    String? message,
    String? roomId,
  }) {
    return ChatViewModel(
      message: message ?? this.message,
      roomId: roomId ?? this.roomId,
    );
  }

  @override
  List<Object?> get props => [message, roomId];
}
