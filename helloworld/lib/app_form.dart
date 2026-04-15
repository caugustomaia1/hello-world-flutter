import 'package:flutter/material.dart';
import 'package:helloworld/l10n/generated/app_localizations.dart';

class AppForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AppForm({super.key});

  void _validateForm() {
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    String? validateRequiredField(String? value) {
      if (value == null || value.isEmpty) {
        return l10n.onboardingLoginRequiredFieldErrorText;
      }
      return null;
    }

    return Form(
      key: _formKey,
      child: Column(
        spacing: 16.0,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              l10n.onboardingLoginInstructionText,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
          FullNameFields(
            firstNameLabel: l10n.onboardingLoginFirstNameLabel,
            lastNameLabel: l10n.onboardingLoginLastNameLabel,
            validator: validateRequiredField,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: l10n.onboardingLoginEmailLabel,
              border: OutlineInputBorder(),
            ),
            validator: validateRequiredField,
          ),
          ElevatedButton(
            onPressed: _validateForm,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text(l10n.onboardingLoginSubmitButton),
          ),
        ],
      ),
    );
  }
}

class FullNameFields extends StatelessWidget {
  final String firstNameLabel;
  final String lastNameLabel;
  final String? Function(String?) validator;

  const FullNameFields({
    super.key,
    required this.firstNameLabel,
    required this.lastNameLabel,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.0,
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: firstNameLabel,
              border: OutlineInputBorder(),
            ),
            validator: validator,
          ),
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: lastNameLabel,
              border: OutlineInputBorder(),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
