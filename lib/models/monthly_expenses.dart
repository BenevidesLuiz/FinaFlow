import 'dart:convert';

class MonthlyExpenses {
  final String id;
  final String title;
  final double amount;
  final int dueDate;

  MonthlyExpenses({
    required this.id,
    required this.title,
    required this.amount,
    required this.dueDate,
  });

  factory MonthlyExpenses.fromJson(Map<String, dynamic> json) {
    return MonthlyExpenses(
      id: json['id'],
      title: json['title'],
      amount: (json['amount'] as num).toDouble(), // Garante que será um double
      dueDate: json['dueDate'],
    );
  }

  factory MonthlyExpenses.fromJsonString(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return MonthlyExpenses.fromJson(jsonMap);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'dueDate': dueDate,
    };
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}
