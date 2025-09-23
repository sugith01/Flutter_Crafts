import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String DispText = "No Task entered";
  List<String> task = [];
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "TO-DO LIST",
            style: TextStyle(color: const Color.fromARGB(255, 233, 230, 230), fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: textcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter Your Task "),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.white,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    setState(() {
                      
                      task.add(textcontroller.text);
                      textcontroller.clear();
                    });
                  },
                  child: Text("ADD"),
                ),
              ],
            ),
            Expanded( 
              child: ListView.builder(
                itemCount: task.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(task[index]),
                        ),
                      ),
                      MaterialButton(
                        child: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                          task.removeAt(index);  
                          });
                          
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
