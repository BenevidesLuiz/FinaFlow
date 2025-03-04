import 'package:FinaFlow/models/monthly_expenses.dart';
import 'package:FinaFlow/storage/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<MonthlyExpenses> monthlyExpenses = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    final expenses = await loadLocallExpenses();
    setState(() {
      monthlyExpenses = expenses;
    });
  }

  @override
  void dispose() {
    saveLocallExpenses(monthlyExpenses);
    super.dispose();
  }

  void _showAddAccountDialog(BuildContext context) {
    final _nameController = TextEditingController();
    final _dueDateController = TextEditingController();
    final _valueController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Conta'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome da Conta',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome da conta';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _dueDateController,
                    decoration: const InputDecoration(
                      labelText: 'Dia de Vencimento',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o dia de vencimento';
                      }
                      final int? day = int.tryParse(value);
                      if (day == null || day < 1 || day > 31) {
                        return 'Por favor, insira um dia válido (1-31)';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _valueController,
                    decoration: const InputDecoration(
                      labelText: 'Valor',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o valor';
                      }
                      final double? amount = double.tryParse(value);
                      if (amount == null) {
                        return 'Por favor, insira um valor válido';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Aqui você pode adicionar a lógica para salvar os dados
                  String name = _nameController.text;
                  String dueDate = _dueDateController.text;
                  String value = _valueController.text;
                  print('Nome: $name, Vencimento: $dueDate, Valor: $value');
                  Get.back();

                  setState(() {
                    monthlyExpenses.add(MonthlyExpenses(
                      id: '$name-$dueDate',
                      title: name,
                      amount: double.parse(value),
                      dueDate: int.parse(dueDate),
                    ));
                  });
                  await saveLocallExpenses(monthlyExpenses);
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.account_circle, size: 40),
          onPressed: () {
            // Ação ao pressionar o ícone de perfil de usuário
            Get.toNamed("/profile");
          },
        ),
        title: const Text("Despesas Mensais"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 40),
            onPressed: () {
              _showAddAccountDialog(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: monthlyExpenses
                .map((e) => Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(e.title[0]),
                        ),
                        title: Text(e.title),
                        subtitle: Text(
                          'Vencimento: ${e.dueDate}',
                          style: const TextStyle(
                            fontSize: 18.0, // Aumenta o tamanho do texto
                            fontWeight:
                                FontWeight.bold, // Deixa o texto em negrito
                          ),
                        ),
                        trailing: Text(
                          'R\$ ${e.amount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20.0, // Aumenta o tamanho do texto
                            fontWeight:
                                FontWeight.bold, // Deixa o texto em negrito
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
