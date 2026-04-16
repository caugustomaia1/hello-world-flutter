import 'package:flutter/material.dart';
import 'package:helloworld/app_map.dart';

class AppForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AppForm({super.key});

  bool _validateForm() {
    return _formKey.currentState!.validate();
  }

  void _login(BuildContext context) {
    if (!_validateForm()) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AppMap()),
    );
  }

  String? _validateRequiredField(String? value) {
    if (value == null || value.isEmpty) {
      return "Campo obrigatório";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16.0,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              "Insira seus dados para entrar",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
          FullNameFields(validator: _validateRequiredField),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: _validateRequiredField,
          ),
          ElevatedButton(
            onPressed: () => _login(context),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              minimumSize: Size(double.infinity, 50),
            ),
            child: const Text("Entrar"),
          ),
        ],
      ),
    );
  }
}

class FullNameFields extends StatelessWidget {
  final String? Function(String?) validator;

  const FullNameFields({super.key, required this.validator});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.0,
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Nome',
              border: OutlineInputBorder(),
            ),
            validator: validator,
          ),
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Sobrenome',
              border: OutlineInputBorder(),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
