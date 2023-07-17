import 'package:json_annotation/json_annotation.dart';
part 'message.g.dart';

@JsonSerializable()
class Message {
  String? id;
  String? senderId;
  String? content;
  String? createdAt;

  Message({this.id, this.senderId, this.content, this.createdAt});

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Message copyWith({
    String? id,
    String? senderId,
    String? content,
    String? createdAt,
  }) {
    return Message(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
