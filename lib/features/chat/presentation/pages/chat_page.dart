import 'package:auto_route/auto_route.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectopia/features/profile/domain/models/response/profile_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/models/core_models/message_room.dart';
import '../cubit/chat_cubit.dart';
import '../widgets/chat_head.dart';
import '../widgets/chat_loader.dart';
import '../widgets/chat_message_form.dart';

@RoutePage()
class ChatPage extends StatelessWidget with AutoRouteWrapper {
  const ChatPage({super.key, required this.profileResponse});

  final ProfileResponse profileResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ChatHead(
        profileResponse: profileResponse,
      )),
      body: Container(
        child: Column(children: [
          Expanded(
              child: Container(
                  child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('rooms').snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isNotEmpty) {
                  QueryDocumentSnapshot data = snapshot.data!.docs.firstWhere(
                      (element) =>
                          element['users'].contains(profileResponse.id) &&
                          element['users'].contains(profileResponse.id));
                  if (data["messages"].isNotEmpty) {
                    final datas = data.data() as Map<String, dynamic>;
                    MessageRoom room = MessageRoom.fromJson(datas);
                    room = room.copyWith(
                        messages: room.messages?.reversed.toList());
                    return ListView.builder(
                      reverse: true,
                      itemCount: data["messages"].length,
                      itemBuilder: (context, index) => Align(
                        alignment: room.messages?[index].senderId ==
                                FirebaseAuth.instance.currentUser!.uid
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: context.verticalPaddingLow,
                          child: BubbleSpecialThree(
                            text: room.messages?[index].content ?? "",
                            isSender: room.messages?[index].senderId ==
                                FirebaseAuth.instance.currentUser!.uid,
                            color: room.messages?[index].senderId ==
                                    FirebaseAuth.instance.currentUser!.uid
                                ? context.colorScheme.primaryContainer
                                : context.colorScheme.outlineVariant,
                            textStyle: context.textTheme.bodyLarge!.copyWith(
                                color: context.colorScheme.onBackground),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text(""),
                    );
                  }
                } else {
                  return Center(
                      child: Container(
                    child: const Text(
                        "Mesajlaşma başlatmak için birini takip edin"),
                  ));
                }
              } else {
                return const ChatLoader();
              }
            },
          ))),
          const ChatMessageForm()
        ]),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..init(profileResponse.id!),
      child: this,
    );
  }
}
