import 'package:flutter/material.dart';
import 'task_form.dart';
import 'task_details.dart';

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final List<Map<String, String>> tasks = [];

  void _addTask(Map<String, String> task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Task List',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: tasks.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Pas de Tache',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 134, 73, 73),
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]['title']!),
                  subtitle: Text(tasks[index]['description']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetailsPage(task: tasks[index]),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: FloatingActionButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskFormPage(),
                ),
              );
              if (result != null) {
                _addTask(result);
              }
            },
            child: Icon(Icons.add),
            backgroundColor: Color.fromARGB(255, 188, 155, 6),
          ),
        ),
      ),
    );
  }
}
