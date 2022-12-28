import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/modules/tasks_list/add_task_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../modules/settings/sittings.dart';
import '../modules/tasks_list/tasks_list.dart';

class HomeLayout extends StatefulWidget {
  static const String routName = 'Home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.todo),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(

        shape: StadiumBorder(
          side: BorderSide(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimary, width: 3),
        ),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        onPressed: () {
          Icon(Icons.offline_pin_outlined, color: Colors.white);
          ShowAddTaskBottomSheet();
        },
        child: Icon(Icons.add, color: Colors.white),




      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            currentIndex: currentIndex,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list, size: 25), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings, size: 25), label: '')
            ]),
      ),
      body: tabs[currentIndex],
    );
  }

  List<Widget> tabs = [TaskListTab(), SettingTab()];

  void ShowAddTaskBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) {

      return AddTaskBottomSheet();
    },);
  }
}
