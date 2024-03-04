import 'package:estudo_dio_flutter/widgets/title_age.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController textController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<String> sexo = ['Masculino', 'Femino'];
  String? valueRadio;
  bool vagasPython = false;
  bool vagasJava = false;
  bool vagasPascal = false;
  double salario = 0.00;
  int? experiencia = 0;

  List<DropdownMenuItem<int>> getList(int value) {
    List<DropdownMenuItem<int>>? lista = [];
    for (int i = 0; i < value; i++) {
      lista.add(
        DropdownMenuItem(
          value: i,
          child: i == 1
              ? Text('${i + 1} ano de experiencia')
              : Text('${i + 1} anos de experiencia'),
        ),
      );
    }
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(title: 'Nome:'),
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const TitleText(title: 'Idade:'),
              TextField(
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1500, 4, 22),
                    lastDate: DateTime(2050, 12, 31),
                  ).then((value) {
                    if (value == null) {
                      return;
                    } else {
                      setState(() {
                        dateController.text =
                            DateFormat('dd/MM/yyyy').format(value);
                      });
                    }
                  });
                },
              ),
              const TitleText(title: 'Sexo:'),
              Column(
                children: sexo.map((e) {
                  return RadioListTile(
                    title: Text(e),
                    value: e,
                    selected: e == valueRadio ? true : false,
                    groupValue: valueRadio,
                    onChanged: (value) {
                      setState(() {
                        valueRadio = value;
                      });
                    },
                  );
                }).toList(),
              ),
              const TitleText(title: 'Vagas:'),
              CheckboxListTile(
                title: const Text('DEV Python'),
                value: vagasPython,
                onChanged: (value) {
                  setState(() {
                    vagasPython = !vagasPython;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('DEV Java'),
                value: vagasJava,
                onChanged: (value) {
                  setState(() {
                    vagasJava = !vagasJava;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('DEV Object Pascal'),
                value: vagasPascal,
                onChanged: (value) {
                  setState(() {
                    vagasPascal = !vagasPascal;
                  });
                },
              ),
              TitleText(
                  title:
                      'Salário pretendido: R\$ ${salario.toStringAsFixed(2)}'),
              Slider(
                min: 0.00,
                max: 20000.00,
                value: salario,
                onChanged: (value) {
                  setState(() {
                    salario = value;
                  });
                },
              ),
              const TitleText(title: 'Tempo de experiencia'),
              DropdownButton<int>(
                isExpanded: true,
                value: experiencia,
                items: getList(10),
                onChanged: (value) {
                  setState(() {
                    experiencia = value;
                  });
                },
              ),
              const Divider(),
              Center(
                child: ElevatedButton(
                  child: const Text('Salvar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
