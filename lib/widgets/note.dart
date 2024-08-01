import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoTile extends StatefulWidget {
  TodoTile({super.key, required this.taskName, required this.deleteTask});
  final String taskName;
  Function(BuildContext)? deleteTask;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {


  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4245137541.
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.04),
      decoration: BoxDecoration(
        color: Colors.yellow[400],
        borderRadius: BorderRadius.circular(10),
      ),
      height: height * 0.15,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width * 0.12,
            child: Checkbox(
              onChanged: (bool? value) {
                // Suggested code may be subject to a license. Learn more: ~LicenseLog:1864459457.
                setState(() {
                  isDone = !isDone;
                });
              },
              value: isDone,
            ),
          ),
          Text(
            widget.taskName,
            style: TextStyle(
                fontSize: height * 0.025,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: isDone ? TextDecoration.lineThrough : null),
          ),
          SizedBox(
            width: width * 0.23,
          ),
          IconButton(
              onPressed: () {
                widget.deleteTask!(context);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: height * 0.035,
              ))
        ],
      ),
    );
  }
}
