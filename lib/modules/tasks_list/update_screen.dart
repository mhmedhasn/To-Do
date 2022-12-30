import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/Task1.dart';

class edit_screen_____ extends StatelessWidget {
  Task task;
  edit_screen_____(this.task);
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text('To Do List',),
      flexibleSpace:SizedBox(height: height*0.2,)),
      body: Form(
        child: Container(
          margin: EdgeInsets.only(top: 30, bottom: 50, left: 30, right: 30),
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Edit Task',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
              TextFormField(
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'please enter your task title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('enter your task title'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),

              TextFormField(
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'please enter your task title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('enter your task details'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  task.date;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select time',
                        style: Theme.of(context).textTheme.headline1),
                    Text('',
                        style: Theme.of(context).textTheme.headline1)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(left: 30,right: 30),

                  width: double.infinity,
                  child: ElevatedButton(

                      onPressed: () {}, child: Text('data')),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
