import 'package:flutter/material.dart';
import 'package:to_do_app/my_screen.dart';
import 'package:to_do_app/widgets/note.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List toDoList = [
    'Төлөвлөгөө бичнэ үү',
  ];

  @override
  Widget build(BuildContext context) {

     void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }
   

    void createNewTask() {
      showDialog(
            context: context,
            builder: (context) {
              String newTask = '';
              return AlertDialog(
                title: const Text('Шинэ даалгавар нэмэх'),
                content: TextField(
                  onChanged: (value) {
                    newTask = value;
                  },
                  decoration: const InputDecoration(hintText: 'Даалгавар оруулна уу'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Цуцлах'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        toDoList.add(newTask);
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Хадгалах'),
                  ),
                ],
              );
            },
          );

    }

    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('Төлөвлөгөө'),
        centerTitle: true,
        backgroundColor: Colors.yellow[400],
        leading: const FlutterLogo(),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyScreen()));
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('lib/assets/profile.JPG'),
            ),
          )
        ],
      ),
      body: (Padding(
          padding: const EdgeInsets.all(25),
          child: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: toDoList[index],
                deleteTask: (context)=>deleteTask(index),
              );
            },
          ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        backgroundColor: Colors.yellow[400],
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
