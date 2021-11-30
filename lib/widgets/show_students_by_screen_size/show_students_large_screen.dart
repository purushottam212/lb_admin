import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:lb_admin/constants/colors.dart';
import 'package:lb_admin/controllers/slot_time_controller.dart';
import 'package:lb_admin/controllers/students_controller.dart';
import 'package:lb_admin/models/students.dart';
import 'package:lb_admin/widgets/nav_bar/custom_textfield.dart';

class ShowStudentsOnLargeScreen extends StatelessWidget {
  ShowStudentsOnLargeScreen({Key? key, this.context, required this.students})
      : super(key: key);
  final BuildContext? context;
  final GetStudents studentsController = Get.find();
  final SlotTimeController slotTimeController = Get.find();
  final TextEditingController addSlotController = TextEditingController();
  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DataTable(
            columns: const [
              DataColumn(label: Text('Student Info')),
              DataColumn(label: Text('Form Username')),
              DataColumn(label: Text('Form Password')),
              DataColumn(label: Text('Scholarship-Type')),
              DataColumn(label: Text('Date & Slot')),
              DataColumn(label: Text('Verified')),
              DataColumn(label: Text('Submitted')),
            ],
            rows: students
                .map((student) => DataRow(cells: [
                      DataCell(Column(
                        children: [
                          Text('${student.name}'),
                          Text(
                            'Contact: ${student.phoneNo}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      )),
                      DataCell(
                        Text('${student.formUsername}'),
                      ),
                      DataCell(
                        Text('${student.formPassword}'),
                      ),
                      DataCell(
                        Text('${student.scholarshipType}'),
                      ),
                      DataCell(
                        '${student.slotTime}' == 'null'
                            ? const Text('NA')
                            : Column(
                                children: [
                                  Text('${student.date}'),
                                  Text('${student.slotTime}'),
                                ],
                              ),
                      ),
                      DataCell(student.formVerified == true
                              ? Center(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Verified"),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green),
                                  ),
                                )
                              : Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        show(context, student);
                                      },
                                      child: const Text("Verify Now"),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Fire Query"),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red),
                                    )
                                  ],
                                )
                          //Text('${student.formVerified}'),
                          ),
                      DataCell(student.formSubmitted == true
                          ? const Text(
                              'Yes',
                              style: TextStyle(color: Colors.blue),
                            )
                          : ElevatedButton(
                              onPressed: student.formVerified! ? () {} : null,
                              child: const Text("Submit Now"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue),
                            ))
                    ]))
                .toList())
      ],
    );
  }

  show(BuildContext context, Student student) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 20,
          child: Container(
              height: 390,
              width: 450,
              color: light,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                      Text('Assign Slot to ${student.name}'),
                      IconButton(
                          onPressed: () async {
                            if (slotTimeController.date.isNotEmpty &&
                                slotTimeController.slotTime.isNotEmpty) {
                              bool slot = await slotTimeController.assignSlot(
                                  student,
                                  slotTimeController.date.toString(),
                                  slotTimeController.slotTime.toString());
                            }
                          },
                          icon: const Icon(
                            Icons.done,
                            color: Colors.green,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          String? _date = await _selectDate(context);
                          slotTimeController.date(_date);
                        },
                        child: const Text('Select Date')),
                    const SizedBox(height: 20),
                    Divider(color: lightGrey, height: 1),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () async {
                          showAddSlotDialog(context);
                        },
                        child: const Text('Add Slot')),
                    const SizedBox(height: 20),
                    Obx(() {
                      if (slotTimeController.isLoading.value) {
                        return const CircularProgressIndicator();
                      } else {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 500,
                          width: MediaQuery.of(context).size.width - 550,
                          child: ListView(
                              shrinkWrap: true,
                              children: slotTimeController.getSlots
                                  .map((slot) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Wrap(
                                            alignment: WrapAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: lightGrey),
                                                  onPressed: () {
                                                    slotTimeController.slotTime(
                                                        '${slot.slotTime}');
                                                  },
                                                  child:
                                                      Text('${slot.slotTime}')),
                                              const SizedBox(width: 30),
                                              IconButton(
                                                  onPressed: () {
                                                    deleteSlot(context,
                                                        slot.id.toString());
                                                  },
                                                  icon: const Icon(Icons.delete,
                                                      color: Colors.red,
                                                      size: 18)),
                                            ]),
                                      ))
                                  .toList()),
                        );
                      }
                    }),
                  ],
                )
              ])),
        );
      },
    );
  }

  showAddSlotDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context1) {
          return Dialog(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 20,
              child: SizedBox(
                  height: 180,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 18,
                            )),
                      ),
                      const Text('Enter slot in this format: (12 to 1) '),
                      CustomTextField(
                        controller: addSlotController,
                        label: 'add Slot',
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                //todo : validate addslotController value
                                addSlot(context1, addSlotController.text);
                              },
                              child: const Text('Add')),
                        ],
                      )
                    ],
                  )));
        });
  }

  addSlot(BuildContext context, String slotTime) async {
    bool slotadded = await slotTimeController.addSlot(slotTime);
    if (slotadded) {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Slot added',
        textAlign: TextAlign.center,
      )));
    }
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Something went wrong', textAlign: TextAlign.center)));
  }

  deleteSlot(BuildContext context, String id) async {
    bool slotDeleted = await slotTimeController.deleteSlot(id);
    if (slotDeleted) {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Slot Deleted', textAlign: TextAlign.center)));
    }
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Something went wrong', textAlign: TextAlign.center)));
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
}
