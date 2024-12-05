import 'package:flutter/material.dart';

class TaskFormPage extends StatefulWidget {
  @override
  _TaskFormPageState createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _taskData = {
    'title': '',
    'description': '',
    'startDate': '',
    'endDate': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retourner'),
      ),
      body: Container(
        // Fond coloré de la page
        color: Colors.blueGrey[50],
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                constraints: BoxConstraints(maxWidth: 400), // Limiter la largeur
                padding: const EdgeInsets.all(16.0), // Ajouter du padding interne
                decoration: BoxDecoration(
                  color: Colors.white, // Couleur de fond du formulaire
                  borderRadius: BorderRadius.circular(15.0), // Coins arrondis
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                      spreadRadius: 3, // Étendue
                      blurRadius: 10, // Flou
                      offset: Offset(0, 3), // Déplacement de l'ombre
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'titre'),
                        onSaved: (value) => _taskData['title'] = value!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Description'),
                        onSaved: (value) => _taskData['description'] = value!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'date debut'),
                        onSaved: (value) => _taskData['startDate'] = value!,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'date fin'),
                        onSaved: (value) => _taskData['endDate'] = value!,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.save();
                          Navigator.pop(context, _taskData);
                        },
                        child: Text('Enregistrer'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
