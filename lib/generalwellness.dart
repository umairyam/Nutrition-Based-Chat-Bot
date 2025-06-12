import 'package:flutter/material.dart';
// import 'package:gemini_ai_test/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:chat_bot/message1.dart';

class generalwellnessnutrition with ChangeNotifier {
  final List<Message> _messages = [];
  late final GenerativeModel _gemini;

  generalwellnessnutrition(String apiKey) {
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
  "You are a nutrition assistant focused on general wellness and healthy living. Your primary role is to provide clear, practical advice on balanced diets, nutrient-rich foods, hydration, meal timing, and lifestyle habits that promote overall health and wellbeing. "
  "Always start with a direct, concise answer to the user's question. "
  "Follow with brief, easy-to-understand tips or explanations that support healthy nutrition choices without overwhelming detail. "
  "Keep responses positive, encouraging, and accessible to people of all nutrition knowledge levels. "
  "Include a 'Disclaimer:' paragraph when advice involves significant diet or lifestyle changes that should be discussed with a healthcare professional or registered dietitian. "
  "Avoid giving personalized meal plans, medical advice, or addressing conditions outside general wellness. "
  "If asked off-topic questions, politely redirect the conversation back to nutrition and wellness."
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