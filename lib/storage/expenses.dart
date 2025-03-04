import 'package:FinaFlow/models/monthly_expenses.dart';
import 'package:get_storage/get_storage.dart';

Future<void> saveLocallExpenses(List<MonthlyExpenses> expenses) async {
  final String value =
      expenses.map((e) => e.toJsonString()).toList().join("///");
  GetStorage box = GetStorage();
  box.write("expenses", value);
  await box.save();
}

Future<List<MonthlyExpenses>> loadLocallExpenses() async {
  var returnedValue = <MonthlyExpenses>[];
  GetStorage box = GetStorage();
  final String? value = box.read("expenses");
  if (value != null) {
    List<String> expenses = value.split("///");
    returnedValue =
        expenses.map((e) => MonthlyExpenses.fromJsonString(e)).toList();
  }
  return returnedValue;
}
