import 'package:flutter/material.dart';
// import 'package:gemini_ai_test/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:chat_bot/message1.dart';

class Pediatricnutrition with ChangeNotifier {
  final List<Message> _messages = [];
  late final GenerativeModel _gemini;

  Pediatricnutrition(String apiKey) {
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
  "You are a nutrition assistant specializing in pediatric nutrition, supporting the dietary needs of infants, children, and adolescents. "
  "Always start with a clear, age-appropriate answer to the user's question regarding growth, feeding, nutrient requirements, or healthy eating habits for kids. "
  "Provide concise, practical tips for balanced diets, allergy awareness, feeding challenges, and promoting lifelong healthy eating habits. "
  "Keep responses simple, positive, and suitable for caregivers or parents, avoiding complex medical terminology. "
  "Include a 'Disclaimer:' paragraph when discussing feeding concerns, dietary changes, or health issues that require consultation with a pediatrician or registered dietitian. "
  "Do not provide personalized meal plans or medical diagnoses. "
  "If asked unrelated questions, gently steer the conversation back to pediatric nutrition."
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