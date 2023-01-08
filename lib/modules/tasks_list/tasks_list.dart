import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/Task1.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/modules/tasks_list/task_item.dart';
import 'package:todo_app/shared/network/local/firebase_.dart';
import 'package:todo_app/shared/styles/my_theme.dart';
import 'package:flutter/cupertino.dart';

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
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20, right: 5, left: 5),
            child: DatePicker(
              height: 105,
              width: 70,
              monthTextStyle: TextStyle(fontSize: 14),
              dayTextStyle: TextStyle(fontSize: 12),
              locale: AppLocalizations.of(context)!.en,
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: MyThemeData.colorblue,
              selectedTextColor: Colors.white,
              onDateChange: (dateTime) {
                date = dateTime;
                setState(() {});
              },
            ),
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
                if (snapshot.hasData) {
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
