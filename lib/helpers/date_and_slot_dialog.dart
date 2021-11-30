/// after verified when it comes to submit form then at that time admin need to select date and time...

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_admin/constants/colors.dart';
import 'package:lb_admin/controllers/slot_time_controller.dart';
import 'package:lb_admin/controllers/students_controller.dart';

dateandslotDaialog(BuildContext context) {
  SlotTimeController slotTimeController = Get.find();
  final GetStudents studentController = Get.put(GetStudents());
  return showDialog(
      context: context,
      builder: (context1) {
        return Dialog(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 20,
            child: SizedBox(
                height: 280,
                width: 500,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            )),
                        const Text('Select Date And Slot'),
                        GetBuilder<GetStudents>(
                            builder: (data) => IconButton(
                                onPressed: () async {
                                  data.isLoading(true);
                                  await data.getVerifiedStudent();

                                  data.isLoading(false);
                                  data.studType(3);
                                },
                                icon: const Icon(
                                  Icons.done,
                                  color: Colors.green,
                                ))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              var date = await _selectDate(context);
                              print('darte $date');
                            },
                            child: const Text('Select Date')),
                        Column(
                          children: [
                            SizedBox(
                              height: 200,
                              width: 200,
                              child: ListView(
                                  shrinkWrap: true,
                                  children: slotTimeController.getSlots
                                      .map((slot) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Wrap(
                                                alignment: WrapAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              primary:
                                                                  lightGrey),
                                                      onPressed: () {
                                                        slotTimeController.slotTime(
                                                            '${slot.slotTime}');
                                                      },
                                                      child: Text(
                                                          '${slot.slotTime}')),
                                                  const SizedBox(width: 30),
                                                ]),
                                          ))
                                      .toList()),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )));
      });
}

Future<String> _selectDate(BuildContext context) async {
  DateTime selectedDate = DateTime.now();
  var currentFormateDate =
      "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
  final DateTime? selected = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(DateTime.now().year),
    lastDate: DateTime(DateTime.now().year + 1),
  );
  if (selected != null && selected != selectedDate) {
    var formateDate = "${selected.day}-${selected.month}-${selected.year}";
    return formateDate;
  }
  return currentFormateDate;
}
