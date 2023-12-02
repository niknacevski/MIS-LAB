import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> subjects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('201052'),
      ),
      backgroundColor: Colors.blue, // Позадината е во сина боја, можете да ја промените според вашиот избор.
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subjects[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  subjects.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String newSubject = "";
        return AlertDialog(
          title: Text('Додади предмет'),
          content: TextField(
            onChanged: (value) {
              newSubject = value;
            },
            decoration: InputDecoration(labelText: 'Име на предметот'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Откажи'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  subjects.add(newSubject);
                });
                Navigator.pop(context);
              },
              child: Text('Додади'),
            ),
          ],
        );
      },
    );
  }
}
