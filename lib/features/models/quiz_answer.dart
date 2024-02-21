class QuizAnswer {
  final int id;
  final int quizId;
  final String answer;

  QuizAnswer({required this.id, required this.quizId, required this.answer});

  factory QuizAnswer.fromMap(Map<String, dynamic> map) {
    return QuizAnswer(
        id: map['id'] ?? '',
        quizId: map['quiz_id'],
        answer: map['answer'] ?? '');
  }
}
