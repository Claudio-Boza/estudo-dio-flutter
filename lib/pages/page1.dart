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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Nome: ',
                border: OutlineInputBorder(),
              ),
            ),
            const Text('Idade:'),
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
            const Text('Sexo:'),
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
            )
          ],
        ),
      ),
    );
  }
}
