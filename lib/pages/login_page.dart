import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              Image.network(
                fit: BoxFit.cover,
                'https://hermes.dio.me/companies/a169bb67-5f72-4289-9778-fcea58dfa19a.png',
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                width: double.infinity,
                child: const Row(
                  children: [
                    Text('Informe seu mail:'),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Email:'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.green,
                height: 30,
                width: double.infinity,
                child: const Text('Login:'),
              ),
              const SizedBox(height: 280),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.green,
                height: 30,
                width: double.infinity,
                child: const Text('Loing:'),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                width: double.infinity,
                child: const Text('Cadastro:'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
