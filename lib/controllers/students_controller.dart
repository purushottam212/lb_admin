import 'package:get/get.dart';
import 'package:lb_admin/models/students.dart';
import 'package:lb_admin/services/api_service/student_apis.dart';

class GetStudents extends GetxController {
  var getStudents = List<Student>.empty().obs;
  var getPendingStudents = List<Student>.empty().obs;
  var getSubmittedStudents = List<Student>.empty().obs;
  var getVerifiedStudents = List<Student>.empty().obs;
  var isLoading = false.obs;
  var studType = 1.obs;
  final StudentApiCalls calls = Get.put(StudentApiCalls());

  @override
  void onInit() async {
    await getAllStudents();
    await getPendingStudent();
    await getVerifiedStudent();
    await getSubmittedStudent();
    super.onInit();
  }

  Future getAllStudents() async {
    isLoading(true);
    var students = await calls.getAllStudents();
    if (students != null) {
      getStudents.assignAll(students);
    }
    isLoading(false);
  }

  Future getPendingStudent() async {
    isLoading(true);
    var pendingStudent = await calls.getPendingStudents(false);
    if (pendingStudent != null) {
      getPendingStudents.assignAll(pendingStudent);
    }
    isLoading(false);
  }

  Future getVerifiedStudent() async {
    isLoading(true);
    var verifiedStudent = await calls.getPendingStudents(true);
    if (verifiedStudent != null) {
      getVerifiedStudents.assignAll(verifiedStudent);
    }
    isLoading(false);
  }

  Future getSubmittedStudent() async {
    isLoading(true);
    var submittedStudents = await calls.getSubmittedStudents(true);
    if (submittedStudents != null) {
      getSubmittedStudents.assignAll(submittedStudents);
    }
    isLoading(false);
  }
}
