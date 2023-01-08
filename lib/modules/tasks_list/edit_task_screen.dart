import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/Task1.dart';
import 'package:todo_app/my_provider.dart';
import 'package:todo_app/shared/network/local/firebase_.dart';
import 'package:todo_app/shared/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class edit_task extends StatelessWidget {
  static const String routName = 'edit_task';

  late Task task;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    task = ModalRoute.of(context)!.settings.arguments as Task;
    var midiaQuery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
            "${AppLocalizations.of(context)!.editTask} ${AppLocalizations.of(context)!.todo}"),
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
                      Text(AppLocalizations.of(context)!.editTask,
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
                                    return '${AppLocalizations.of(context)!.please}${AppLocalizations.of(context)!.enterYourTaskTitle}';
                                  }
                                  return null;
                                },
                                initialValue: task.title,
                                onChanged: (value) {
                                  task.title = value;
                                },
                                decoration: InputDecoration(
                                  label: Text(AppLocalizations.of(context)!
                                      .enterYourTaskTitle),
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
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .enterYourTaskDetails;
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  task.description = value;
                                },
                                initialValue: task.description,
                                decoration: InputDecoration(
                                  label: Text(AppLocalizations.of(context)!
                                      .enterYourTaskDetails),
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
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  sheewDateTime_edit(context);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!
                                            .selectTime,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1),
                                    Text(
                                        DateTime.fromMillisecondsSinceEpoch(
                                                task.date)
                                            .toString(),
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
                                    onPressed: () {
                                      updateTaskToFireStore(task).then((value) {
                                        print("___________________________");
                                      });
                                      Navigator.pop(context);
                                    },
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
        initialDate: SelectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (holdsdate == null) return;
    if (holdsdate != null) SelectedDate = holdsdate;
    task.date = SelectedDate.millisecondsSinceEpoch;
  }
}
