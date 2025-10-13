import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/ai_assistance_collection.dart';
part 'ai_assistance_state.dart';

final List<AIAssistanceCollection> qaData = [
  AIAssistanceCollection(
    query: "What is the importance of AC unit inspection?",
    answer:
        "AC unit inspection is crucial for ensuring the efficiency and longevity of the system. It involves checking the condition of components such as filters, coils, and refrigerant levels to detect issues that could affect performance. Regular inspections help in identifying potential problems before they lead to expensive repairs or breakdowns.",
    context: [],
  ),
  AIAssistanceCollection(
    query: "How often should AC units be inspected?",
    answer:
        "AC units should be inspected at least once a year, ideally before the start of the cooling season. However, if the unit is used frequently or in harsh conditions, inspections may need to be more frequent. Regular check-ups ensure the system runs smoothly and efficiently.",
    context: [],
  ),
  AIAssistanceCollection(
    query: "What tools are used for AC unit maintenance?",
    answer:
        "Various tools are used in AC unit maintenance, including vacuum pumps, refrigerant gauges, leak detectors, and coil cleaning brushes. These tools help clean, maintain, and monitor the condition of essential components, ensuring the AC operates efficiently.",
    context: [],
  ),
  AIAssistanceCollection(
    query: "What is the purpose of the AC evaporator coil?",
    answer:
        "The AC evaporator coil is responsible for absorbing heat from the air inside the building. As the refrigerant inside the coil evaporates, it cools the air before circulating it throughout the space. Keeping the evaporator coil clean is essential for maintaining efficient cooling.",
    context: [],
  ),
  AIAssistanceCollection(
    query: "How are refrigerant leaks in AC units repaired?",
    answer:
        "Refrigerant leaks in AC units are typically repaired by locating the source of the leak using leak detectors. Once identified, the leak is sealed or the damaged component is replaced, and the system is recharged with the correct amount of refrigerant to restore proper function.",
    context: [],
  ),
  AIAssistanceCollection(
    query: "What are the different types of AC systems?",
    answer:
        "There are several types of AC systems, including split systems, window units, portable units, and ductless mini-split systems. Each type varies in terms of installation requirements, energy efficiency, and cooling capacity.",
    context: [],
  ),
  AIAssistanceCollection(
    query: "What is AC compressor failure, and how is it prevented?",
    answer:
        "AC compressor failure occurs when the compressor, which pumps refrigerant through the system, breaks down. This can be caused by electrical issues, low refrigerant levels, or blocked airflow. Preventative maintenance, such as ensuring proper refrigerant levels and regular inspection of electrical components, can help prevent compressor failure.",
    context: [],
  ),
  AIAssistanceCollection(
    query: "What is an AC condenser, and how does it contribute to cooling?",
    answer:
        "The AC condenser is a key component that releases the heat absorbed by the evaporator coil. It transforms the refrigerant from a gas back into a liquid state by dissipating the heat outside the building. Maintaining a clean and functional condenser is essential for efficient cooling.",
    context: [],
  ),
  AIAssistanceCollection(
    query: "How does the weather affect AC unit performance?",
    answer:
        "Weather can significantly impact AC unit performance. Extreme heat can strain the system, causing it to work harder and possibly overheat. Additionally, high humidity levels can affect the efficiency of cooling. Regular maintenance helps ensure that the system operates at optimal levels, regardless of weather conditions.",
    context: [],
  ),
  AIAssistanceCollection(
    query: "What are some common AC problems that require immediate attention?",
    answer:
        "Common AC problems that require immediate attention include refrigerant leaks, frozen coils, electrical issues, thermostat malfunctions, and blocked airflow. If the system is not cooling properly or making unusual noises, it’s essential to address the issue promptly to avoid further damage.",
    context: [],
  ),
];

class AIAssistanceCubit extends Cubit<AIAssistanceState> {
  AIAssistanceCubit() : super(AIAssistanceInitial());

  List<AIAssistanceCollection> chatHistory = [];
  int? loadingIndex;

  Future<void> sendMessage(String query) async {
    final index = chatHistory.length;
    loadingIndex = index * 2;
    emit(AIAssistanceLoading(loadingIndex: loadingIndex!));

    await Future.delayed(Duration(seconds: 2));
    String queryLower = query.toLowerCase();

    AIAssistanceCollection? answerData = qaData.firstWhere(
      (item) {
        return item.query
            .toLowerCase()
            .split(" ")
            .any((word) => queryLower.contains(word));
      },
      orElse: () => AIAssistanceCollection(
        query: query,
        answer: "Sorry, I couldn't find an answer for that.",
        context: [],
      ),
    );

    chatHistory.add(AIAssistanceCollection(
        query: query, answer: answerData.answer, context: []));

    emit(AIAssistanceHistoryLoaded(chatHistory));
  }

  void getHistory() {
    emit(AIAssistanceHistoryLoaded(chatHistory));
  }
}
