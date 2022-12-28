import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/Task1.dart';
import 'package:todo_app/modules/tasks_list/calendar.dart';
import 'package:todo_app/modules/tasks_list/task_item.dart';
import 'package:todo_app/shared/network/local/firebase_.dart';

class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DateTimeLine(
            width: 20,
            color: Colors.black12,
            hintText: '',
            onSelected: (val) {
              date = val;
              setState(() {});
            },
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Task>>(
              stream: getTaskFromFirestore(date),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('something went wrong'));
                }
                if(snapshot.hasData){

                  var tasks =
                      snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                  print(tasks);
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      // print(tasks[index].date);
                      return TaskItem(tasks[index]);
                    },
                      itemCount: tasks.length,
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
