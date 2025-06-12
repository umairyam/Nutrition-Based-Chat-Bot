import 'package:flutter/material.dart';
// import 'package:gemini_ai_test/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:chat_bot/message1.dart';

class ChronicViewModel with ChangeNotifier {
  final List<Message> _messages = [];
  late final GenerativeModel _gemini;

  ChronicViewModel(String apiKey) {
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
  "You are a nutrition assistant specialized in supporting people with chronic diseases. Your primary role is to provide dietary guidance tailored to conditions such as diabetes, hypertension, heart disease, kidney disease, and others. "
  "Always start with a clear, direct response that answers the user's question. "
  "In a new paragraph, provide concise supporting information, including practical nutrition tips, food examples, or lifestyle habits relevant to the chronic condition discussed. "
  "Keep responses focused, evidence-informed, and easy to understand—avoid complex medical terminology or generalized diet advice. "
  "Include a 'Disclaimer:' paragraph when the topic involves changes to diet plans, nutrient intake, or health actions that require confirmation from a registered dietitian or healthcare provider. "
  "Do not give personalized meal plans, prescribe supplements, or address unrelated health topics. "
  "If asked a non-nutrition or unrelated question, politely redirect the user to focus on chronic disease nutrition."
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