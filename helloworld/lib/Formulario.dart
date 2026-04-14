import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  final _campoVazio = GlobalKey<FormState>();

  Formulario({super.key});

  void _validaCampoVazio() {
    _campoVazio.currentState!.validate();
  }

  String? _validarCampoObrigatorio(String? value) {
    if (value == null || value.isEmpty) {
      return "Campo obrigatório";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _campoVazio,
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
          Row(
            spacing: 16.0,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validarCampoObrigatorio,
                ),
              ),
              //const SizedBox(width: 16.0),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Sobrenome',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validarCampoObrigatorio,
                ),
              ),
            ],
          ),
          //const SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: _validarCampoObrigatorio,
          ),
          //const SizedBox(height: 50.0),
          ElevatedButton(
            onPressed: _validaCampoVazio,
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
