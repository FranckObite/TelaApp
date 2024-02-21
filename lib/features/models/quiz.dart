class Quiz {
  final int id;
  final String question;
  Quiz({
    required this.id,
    required this.question,
  });

  Quiz copyWith({
    int? id,
    String? question,
  }) {
    return Quiz(
      id: id ?? this.id,
      question: question ?? this.question,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      id: map['id']?.toInt() ?? 0,
      question: map['question'] ?? '',
    );
  }
}
