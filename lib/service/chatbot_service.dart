import 'dart:convert';
import 'package:chatbot_bloc/model/chatbot_model.dart';
import 'package:http/http.dart' as http;

class ChatbotService {
  static Future<ChatbotModel> sendMessage(String msg) async {
    // Replace it with your local URL as instructed in the repository description
    // for example
    const url = "http://192.168.1.100:8000";
    try {
      var response = await http.get(Uri.parse("$url/chatbot?msg=$msg"));
      if (response.statusCode == 200) {
        return ChatbotModel.fromJson(jsonDecode(response.body));
      } else {
        return ChatbotModel(
            mostSimilarQuestion: "",
            isSyonym: "No",
            message: "Error: unable to connect to server");
      }
    } catch (e) {
      print("Error occurred: $e");
      return ChatbotModel(
          mostSimilarQuestion: "",
          isSyonym: "No",
          message: "Error: unable to connect to server");
    }
  }
}
