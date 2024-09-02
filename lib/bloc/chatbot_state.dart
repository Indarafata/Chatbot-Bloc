import 'package:equatable/equatable.dart';

abstract class ChatbotState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChatbotInitial extends ChatbotState {}

class ChatbotLoading extends ChatbotState {}

class ChatbotMessageSent extends ChatbotState {
  final List<String> chat;
  final int bubbleChatCount;

  ChatbotMessageSent(this.chat, this.bubbleChatCount);

  @override
  List<Object> get props => [chat, bubbleChatCount];
}

class ChatbotError extends ChatbotState {
  final String message;

  ChatbotError(this.message);

  @override
  List<Object> get props => [message];
}
