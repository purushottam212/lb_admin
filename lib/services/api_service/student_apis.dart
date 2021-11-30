import 'package:http/http.dart' as http;
import 'package:lb_admin/models/students.dart';

class StudentApiCalls {
  final String _baseUrl = 'http://localhost:8080';

  Future<List<Student>?> getAllStudents() async {
    var response = await http.get(
      Uri.parse('$_baseUrl/admin/getStudents'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*"
      },
    );

    if (response.statusCode == 200) {
      return studentsListFromJson(response.body);
    } else {
      return null;
    }
  }

  //Get Pending student List (yet to be verified)

  Future<List<Student>?> getPendingStudents(bool verified) async {
    var response = await http.get(
      Uri.parse('$_baseUrl/admin/verify/$verified'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*"
      },
    );

    if (response.statusCode == 200) {
      return studentsListFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Student>?> getSubmittedStudents(bool submitted) async {
    var response = await http.get(
      Uri.parse('$_baseUrl/admin//submit/$submitted'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*"
      },
    );

    if (response.statusCode == 200) {
      return studentsListFromJson(response.body);
    } else {
      return null;
    }
  }
}
