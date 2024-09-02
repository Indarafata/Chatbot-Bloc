import 'dart:convert';

ChatbotModel ChatbotFromJson(String str) => ChatbotModel.fromJson(json.decode(str));

String ChatbotToJson(ChatbotModel data) => json.encode(data.toJson());

class ChatbotModel {
    String? isSyonym;
    String message;
    String? mostSimilarQuestion;

    ChatbotModel({
        this.isSyonym,
        required this.message,
        this.mostSimilarQuestion,
    });

    factory ChatbotModel.fromJson(Map<String, dynamic> json) => ChatbotModel(
        isSyonym: json["is_syonym"],
        message: json["message"],
        mostSimilarQuestion: json["most_similar_question"],
    );

    Map<String, dynamic> toJson() => {
        "is_syonym": isSyonym,
        "message": message,
        "most_similar_question": mostSimilarQuestion,
    };
}
