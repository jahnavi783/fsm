part of 'ai_assistance_cubit.dart';

sealed class AIAssistanceState extends Equatable {
  const AIAssistanceState();

  @override
  List<Object> get props => [];
}

class AIAssistanceInitial extends AIAssistanceState {}

class AIAssistanceLoading extends AIAssistanceState {
  final int loadingIndex;

  const AIAssistanceLoading({required this.loadingIndex});

  @override
  List<Object> get props => [loadingIndex];
}

class AIAssistanceHistoryLoaded extends AIAssistanceState {
  final List<AIAssistanceCollection> result;

  const AIAssistanceHistoryLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class AIAssistanceSendQueryLoaded extends AIAssistanceState {}

class AIAssistanceError extends AIAssistanceState {}
