import 'dart:convert';
import 'package:lb_admin/models/slot_time_model.dart';
import 'package:http/http.dart' as http;
import 'package:lb_admin/models/students.dart';

class SlotApiCalls {
  final String _baseUrl = 'http://localhost:8080';

  Future<List<SlotTimeModel>?> getAllSlotTimes() async {
    var response = await http.get(
      Uri.parse('$_baseUrl/admin/slots/getSlots'),
      headers: <String, String>{
        // 'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*"
      },
    );

    if (response.statusCode == 200) {
      return slotTimeModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> addSlot(var slotTime) async {
    var response = await http.post(
      Uri.parse('http://localhost:8080/admin/assignSlot'),
      body: jsonEncode({'slotTime': slotTime}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*"
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteSlot(String id) async {
    var response = await http.delete(
      Uri.parse('$_baseUrl/admin/slots/deleteSlot/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*"
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<Student?> assignSlot(Student student, var date, var slotTime) async {
    var response = await http.post(
      Uri.parse('$_baseUrl/admin/assignSlot'),
      body: json.encode({
        "name": student.name,
        "email": student.email,
        "phoneNo": student.phoneNo,
        "formUsername": student.formUsername,
        "formPassword": student.formPassword,
        "scholarshipType": student.scholarshipType,
        "password": student.password,
        "formVerified": student.formVerified,
        "formSubmitted": student.formSubmitted,
        "date": date,
        "slotTime": slotTime
      }),
      headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        "Access-Control-Allow-Origin": "*"
      },
    );

    if (response.statusCode == 200) {
      return studentFromJson(response.body);
    } else {
      return null;
    }
  }
}
