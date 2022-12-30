import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/Task1.dart';
import 'package:todo_app/my_provider.dart';
import 'package:todo_app/shared/styles/my_theme.dart';

class edit_task extends StatelessWidget {
  static const String routName = 'edit_task';
  Task task;

  edit_task(this.task);

  @override
  Widget build(BuildContext context) {
    task=ModalRoute.of(context)!.settings.arguments as Task;
    var formkey = GlobalKey<FormState>();
    var midiaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit task todo'),
        elevation: 0.0,
        backgroundColor: MyThemeData.colorblue,
        centerTitle: false,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(children: [
            Positioned(
                child: Container(
              width: double.infinity,
              height: midiaQuery.height * 0.2,
              color: MyThemeData.colorblue,
            )),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: midiaQuery.height * 0.70,
                  width: midiaQuery.width * 0.85,
                  color: MyThemeData.colorWhite,
                  child: Column(
                    children: [
                      Text('Edit Task',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Form(
                        key: formkey,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'please enter your task title';
                                  }
                                  return null;
                                },
                                initialValue: task.title,
                                decoration: InputDecoration(
                                  label: Text('enter your task title'),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              TextFormField(
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'please enter your task title';
                                  }
                                  return null;
                                },
                                initialValue: task.description,
                                decoration: InputDecoration(
                                  label: Text('enter your task details'),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              InkWell(
                                onTap: () {
                                  sheewDateTime_edit(context);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Select time',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1),
                                    Text('${task.date}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  margin: EdgeInsets.only(left: 30, right: 30),
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('data'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                )
              ],
            ))
          ])),
    );
  }




  DateTime SelectedDate = DateTime.now();
  void sheewDateTime_edit(context) async {
    DateTime? holdsdate = await showDatePicker(
        context: context,
        initialDate:SelectedDate ,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (holdsdate == null) return;
    if(holdsdate!=null)

    SelectedDate = holdsdate;
  }
}
