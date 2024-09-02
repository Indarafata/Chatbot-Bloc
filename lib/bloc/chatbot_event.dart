import 'package:equatable/equatable.dart';

abstract class ChatbotEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatbotEvent {
  final String message;

  SendMessageEvent(this.message);

  @override
  List<Object> get props => [message];
}
