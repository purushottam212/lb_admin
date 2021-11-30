import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_admin/constants/colors.dart';
import 'package:lb_admin/controllers/slot_time_controller.dart';
import 'package:lb_admin/controllers/students_controller.dart';
import 'package:lb_admin/helpers/date_and_slot_dialog.dart';
import 'package:lb_admin/helpers/handle_responsiveness.dart';
import 'package:lb_admin/widgets/custom_card.dart';
import 'package:lb_admin/widgets/nav_bar/nav_bar.dart';
import 'package:lb_admin/widgets/show_students_by_screen_size/show_students_large_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> sKey = GlobalKey();

  final GetStudents studentController = Get.put(GetStudents());
  final SlotTimeController slotTimeController = Get.put(SlotTimeController());
  bool isWaiting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: sKey,
        body: HandleResponsiveness.isLargeScreen(context) ||
                HandleResponsiveness.isCustomScreen(context)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    NavigationBar(scaffoldkey: sKey),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Hey , LB-Admin',
                          style: TextStyle(color: lightGrey, fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Obx(() {
                        if (studentController.isLoading.value) {
                          return Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Wait your result is on the way!! ',
                              style: TextStyle(color: lightGrey, fontSize: 16),
                            ),
                          );
                        } else {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomCard(
                                    color: Colors.black,
                                    count: studentController.getStudents.length
                                        .toString(),
                                    label: 'All',
                                    icon: Icons.people_alt_sharp,
                                    onTap: () async {
                                      studentController.isLoading(true);
                                      await studentController.getAllStudents();

                                      studentController.isLoading(false);
                                      studentController.studType(1);
                                    },
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  CustomCard(
                                      color: Colors.red,
                                      count: studentController
                                          .getPendingStudents.length
                                          .toString(),
                                      label: 'Pending',
                                      icon: Icons.pending,
                                      onTap: () async {
                                        studentController.isLoading(true);
                                        await studentController
                                            .getPendingStudent();

                                        studentController.isLoading(false);
                                        studentController.studType(2);
                                      }),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  CustomCard(
                                      onTap: () async {
                                        /* studentController.isLoading(true);
                                        await studentController
                                            .getVerifiedStudent();

                                        studentController.isLoading(false);
                                        studentController.studType(3);*/
                                        dateandslotDaialog(context);
                                      },
                                      color: Colors.green,
                                      count:
                                          '${studentController.getVerifiedStudents.length}',
                                      label: 'Verified',
                                      icon: Icons.verified),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  CustomCard(
                                      color: Colors.blue,
                                      count:
                                          '${studentController.getSubmittedStudents.length}',
                                      label: 'Submitted',
                                      icon: Icons.done,
                                      onTap: () async {
                                        studentController.isLoading(true);
                                        await studentController
                                            .getSubmittedStudent();

                                        studentController.isLoading(false);
                                        studentController.studType(4);
                                      })
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              ShowStudentsOnLargeScreen(
                                students: studentController.studType.value == 1
                                    ? studentController.getStudents
                                    : studentController.studType.value == 2
                                        ? studentController.getPendingStudents
                                        : studentController.studType.value == 3
                                            ? studentController
                                                .getVerifiedStudents
                                            : studentController
                                                .getSubmittedStudents,
                                context: context,
                              )
                            ],
                          );
                        }
                      }
                          // specify type as Controller
                          ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    NavigationBar(scaffoldkey: sKey),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Hey , LB-Admin',
                          style: TextStyle(color: lightGrey, fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Obx(() {
                      if (studentController.isLoading.value) {
                        return Center(
                          child: Text(
                            'Wait your result is on the way!!',
                            style: TextStyle(color: lightGrey, fontSize: 15),
                          ),
                        );
                      } else {
                        return GridView(
                            padding: const EdgeInsets.all(32),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            3)),
                            children: [
                              CustomCard(
                                  color: Colors.black,
                                  count: '1200',
                                  label: 'All',
                                  icon: Icons.people_alt_sharp,
                                  onTap: () async {}),
                              CustomCard(
                                  color: Colors.red,
                                  count: '600',
                                  label: 'Pending',
                                  icon: Icons.pending,
                                  onTap: () async {}),
                              CustomCard(
                                  color: Colors.green,
                                  count: '400',
                                  label: 'Verified',
                                  icon: Icons.verified,
                                  onTap: () async {}),
                              CustomCard(
                                  color: Colors.blue,
                                  count: '200',
                                  label: 'Submitted',
                                  icon: Icons.done,
                                  onTap: () async {})
                            ]);
                      }
                    })
                  ],
                ),
              ));
  }
}
