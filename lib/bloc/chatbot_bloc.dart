import 'package:chatbot_bloc/service/chatbot_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chatbot_event.dart';
import 'chatbot_state.dart';

class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
  List<String> chat = [];
  int bubbleChatCount = 0;

  ChatbotBloc() : super(ChatbotInitial()) {
    on<SendMessageEvent>((event, emit) async {
      emit(ChatbotLoading());

      try {
        final response = await ChatbotService.sendMessage(event.message);
        // List<String> chat = [event.message, response?.message ?? ""];
        chat.add(event.message);
        chat.add(response.message);
        bubbleChatCount += 2;

        emit(ChatbotMessageSent(chat, bubbleChatCount));
      } catch (e) {
        emit(ChatbotError('Cek Koneksi Anda'));
      }
    });
  }
}
