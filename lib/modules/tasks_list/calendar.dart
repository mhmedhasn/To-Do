import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef Callback = void Function(DateTime val);

class DateTimeLine extends StatefulWidget {
  final double width;
  final Color color;
  final String hintText;
  final Callback onSelected;

  const DateTimeLine(
      {Key? key,
      required this.width,
      required this.color,
      required this.onSelected,
      required this.hintText})
      : super(key: key);

  @override
  State<DateTimeLine> createState() => DateTimeLineState();
}

class DateTimeLineState extends State<DateTimeLine> {
  String hintText = '';
  List dates = [];
  List monthYear = [];
  DateTime selectedDate = DateTime.now();
  Color color = const Color.fromARGB(255, 135, 194, 99);
  late ScrollController scrollController;

  monthSelector(DateTime date) {
    final DateFormat monthFormatter = DateFormat('MMMM');
    final String month = monthFormatter.format(date);
    final DateFormat yearFormatter = DateFormat('y');
    final String year = yearFormatter.format(date);
    setState(() {
      monthYear = [];
      monthYear.addAll([month, year]);
    });
  }

  dateGenerator(DateTime date) {
    setState(() {
      dates = [];
      for (var i = 15; i >= 0; i--) {
        dates.add(date.subtract(Duration(days: i)));
      }

      for (var i = 1; i <= 15; i++) {
        dates.add(date.add(Duration(days: i)));
      }
    });
  }

  scrollPicker(DateTime dateTime) {
    late bool isSelected;

    dateTime == selectedDate ? isSelected = true : isSelected = false;

    final DateFormat dayFormatter = DateFormat('E');
    final String day = dayFormatter.format(dateTime);

    final DateFormat dateFormatter = DateFormat('d');
    final String date = dateFormatter.format(dateTime);

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedDate = dateTime;
            // widget.onSelected(dateTime);
            scrollController.animateTo(
                845 - (MediaQuery.of(context).size.width - 500) * 0.49,
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease);
            monthSelector(selectedDate);
            isSelected = false;
            dateGenerator(selectedDate);
          });
        },
        child: Container(
          width: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(0)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    day,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: !isSelected ? Colors.black : Colors.blueAccent,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: !isSelected ? Colors.black : Colors.blueAccent,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    scrollController = ScrollController(
      initialScrollOffset: 845 - (widget.width - 500) * 0.49,
      keepScrollOffset: true,
    );
    color = widget.color;
    hintText = widget.hintText;
    dateGenerator(selectedDate);
    monthSelector(selectedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         // Row(
            //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         //   children: [
            //         //     Text(
            //         //       monthYear[0],
            //         //       style: const TextStyle(
            //         //           color: Colors.black87,
            //         //           letterSpacing: 0,
            //         //           fontSize: 20,
            //         //           fontWeight: FontWeight.w600),
            //         //     ),
            //         //     const SizedBox(
            //         //       width: 10,
            //         //     ),
            //         //     Text(
            //         //       monthYear[1],
            //         //       style: const TextStyle(
            //         //           color: Colors.black87,
            //         //           letterSpacing: 0,
            //         //           fontSize: 20,
            //         //           fontWeight: FontWeight.w600),
            //         //     ),
            //         //   ],
            //         // ),
            //         const SizedBox(
            //           height: 10,
            //         ),
            //         Padding(
            //           padding: EdgeInsets.only(
            //               right: MediaQuery.of(context).size.width / 6.5),
            //           child: Text(hintText),
            //         ),
            //       ],
            //     ),
            //     //Text(result.toString()),
            //     GestureDetector(
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           shape: BoxShape.circle,
            //         ),
            //         child: CircleAvatar(
            //           radius: 27,
            //           backgroundColor: color,
            //           child: const Icon(
            //             Icons.calendar_today_rounded,
            //             color: Colors.white,
            //             size: 30,
            //           ),
            //         ),
            //       ),
            //       onTap: () async {
            //         var pickedDate_ = await showDatePicker(
            //             context: context,
            //             initialDate: DateTime.now(),
            //             firstDate: DateTime(2020),
            //             lastDate: DateTime(2055));
            //         if (pickedDate_ != null) {
            //           setState(() {
            //             scrollController.animateTo(
            //                 845 -
            //                     (MediaQuery.of(context).size.width - 500) *
            //                         0.49,
            //                 duration: const Duration(milliseconds: 200),
            //                 curve: Curves.ease);
            //             selectedDate = pickedDate_;
            //             // widget.onSelected(pickedDate_);
            //           });
            //           dateGenerator(pickedDate_);
            //           monthSelector(pickedDate_);
            //         }
            //       },
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 90,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  itemCount: dates.length,
                  itemBuilder: (context, index) {
                    return Container(child: scrollPicker(dates[index]));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
