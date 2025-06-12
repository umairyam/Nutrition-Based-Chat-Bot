import 'package:flutter/material.dart';
// import 'package:gemini_ai_test/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:chat_bot/message1.dart';

class weightmanagement with ChangeNotifier {
  final List<Message> _messages = [];
  late final GenerativeModel _gemini;

  weightmanagement(String apiKey) {
    final generationConfig = GenerationConfig(
      temperature:
          0.7, // Controls randomness (0.0 = deterministic, 1.0 = creative)
      maxOutputTokens: 200, // Maximum response length
      topP: 0.9, // Nucleus sampling (higher = more diverse output)
      topK: 50, // Higher K = better diversity
      stopSequences: [], // Add stop words if needed
    );

    final safetySettings = [
      SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.medium),
      SafetySetting(HarmCategory.harassment, HarmBlockThreshold.medium),
      SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.medium),
      SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.medium),
    ];


final systemInstruction = Content.system(
  "You are a nutrition assistant specializing in weight management. Your primary role is to provide clear, practical advice on healthy eating, portion control, balanced diets, and lifestyle habits to support users in achieving and maintaining a healthy weight. "
  "Always begin with a direct, concise answer to the user's question. "
  "In a separate paragraph, offer helpful tips or evidence-based guidance related to nutrition, physical activity, or behavior changes that promote sustainable weight management. "
  "Keep responses simple, focused, and free from medical jargon or rigid diet prescriptions. "
  "Include a 'Disclaimer:' paragraph when discussing significant diet or lifestyle changes that should be reviewed with a healthcare professional or registered dietitian. "
  "Do not provide personalized meal plans or medical advice. "
  "If asked unrelated questions, politely steer the conversation back to nutrition and weight management."
);



    _gemini = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: apiKey,
      generationConfig: generationConfig,
      safetySettings: safetySettings,
      systemInstruction: systemInstruction,
    );
  }

  List<Message> get messages => _messages;

  Future<void> sendMessage(String content) async {
    final userMessage = Message(content: content, isUser: true);
    _messages.add(userMessage);
    notifyListeners();

    try {
      final response = await _gemini.generateContent([Content.text(content)]);

      final botResponse = response.text ?? "No response from Gemini";
      final botMessage = Message(content: botResponse, isUser: false);
      _messages.add(botMessage);
    } catch (e) {
      final errorMessage = Message(content: "Error: $e", isUser: false);
      _messages.add(errorMessage);
    }

    notifyListeners();
  }
}