import 'package:connectopia/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:connectopia/features/chat/presentation/cubit/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class ChatMessageForm extends StatelessWidget {
  const ChatMessageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatViewModel>(
      builder: (context, state) {
        return Container(
          padding: context.paddingLow,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: TextEditingController.fromValue(TextEditingValue(
                      text: state.message ?? "",
                      selection: TextSelection.collapsed(
                          offset: state.message?.length ?? 0))),
                  onChanged: (value) {
                    context.read<ChatCubit>().onMessageChanged(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Mesajınızı yazın",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Container(
                padding: context.horizontalPaddingLow,
                child: IconButton(
                  onPressed: () {
                    context.read<ChatCubit>().onMessageSend();
                  },
                  icon: const Icon(Icons.send),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
