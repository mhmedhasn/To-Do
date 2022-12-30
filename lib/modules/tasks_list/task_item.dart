import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/models/Task1.dart';
import 'package:todo_app/modules/tasks_list/edit_task_screen.dart';
import 'package:todo_app/shared/network/local/firebase_.dart';
import 'package:todo_app/shared/styles/my_theme.dart';

class TaskItem extends StatelessWidget {
  Task task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          extentRatio: 1 / 3,
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              onPressed: (context) {
                deleteTaskeToFireStore(task.id);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              autoClose: false,
            ),
            SlidableAction(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => edit_task(task),
                ));
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'edit',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 62,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 task.isDone? Text(
                  task.title, style: TextStyle(fontSize:20,color: Colors.green,fontWeight: FontWeight.bold)
                  ): Text(
                    task.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  task.isDone?Text(task.description,style: TextStyle(color: Colors.green),):Text(task.description)
                ],
              )),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  isDone(task);

                },
                child: task.isDone?Text('is done',style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold,fontSize: 16 ),):Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8)),

                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 30,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
