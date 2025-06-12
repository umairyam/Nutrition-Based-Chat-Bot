import 'package:flutter/material.dart';
// import 'package:gemini_ai_test/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:chat_bot/message1.dart';

class Sportsnutrition with ChangeNotifier {
  final List<Message> _messages = [];
  late final GenerativeModel _gemini;

  Sportsnutrition(String apiKey) {
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
    "You are a nutrition assistant specializing in sports and performance nutrition. Your primary role is to provide clear, practical advice on fueling, hydration, recovery, and nutrient timing to support athletic performance and training goals. "
  "Always start with a direct, concise answer to the user’s question about diet strategies, supplements, or nutrition for endurance, strength, or general fitness. "
  "Follow with brief, evidence-based tips on macronutrient balance, meal planning, pre- and post-workout nutrition, and healthy lifestyle habits for athletes. "
  "Keep responses focused, jargon-free, and suitable for athletes at all levels. "
  "Include a 'Disclaimer:' paragraph when discussing supplements, significant dietary changes, or health concerns that require consultation with a sports dietitian or healthcare professional. "
  "Do not provide personalized meal plans, prescribe supplements, or diagnose medical conditions. "
  "If asked unrelated questions, politely steer the conversation back to sports nutrition and performance."
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