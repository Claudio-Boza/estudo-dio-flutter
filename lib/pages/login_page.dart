import 'package:estudo_dio_flutter/pages/page1.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              // Image.network(
              //   fit: BoxFit.cover,
              //   'https://hermes.dio.me/companies/a169bb67-5f72-4289-9778-fcea58dfa19a.png',
              // ),
              const SizedBox(height: 30),
              TextField(
                controller: emailControler,
                decoration: const InputDecoration(
                  labelText: 'Email:',
                  icon: Icon(
                    Icons.mail,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: obscure,
                controller: passwordControler,
                decoration: InputDecoration(
                    labelText: 'Senha: ',
                    icon: const Icon(
                      Icons.password,
                      color: Colors.green,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      icon: Icon(obscure ? Icons.password_outlined : Icons.add),
                    )),
              ),
              const SizedBox(height: 280),
              ElevatedButton(onPressed: () {}, child: const Text('Entrar')),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Page1()));
                },
                child: const Text('Cadastar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
