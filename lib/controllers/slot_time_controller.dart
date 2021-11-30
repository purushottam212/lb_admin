import 'package:get/get.dart';
import 'package:lb_admin/models/slot_time_model.dart';
import 'package:lb_admin/models/students.dart';
import 'package:lb_admin/services/api_service/slot_apis.dart';

class SlotTimeController extends GetxController {
  var getSlots = List<SlotTimeModel>.empty().obs;
  var isLoading = false.obs;
  var date = ''.obs;
  var slotTime = ''.obs;

  SlotApiCalls calls = Get.put(SlotApiCalls());

  @override
  void onInit() {
    getAllSlotTimes();
    super.onInit();
  }

  Future getAllSlotTimes() async {
    isLoading(true);
    var slots = await calls.getAllSlotTimes();
    if (slots != null) {
      getSlots.assignAll(slots);
    }
    isLoading(false);
  }

  Future<bool> addSlot(var slotTime) async {
    isLoading(true);
    bool slotAdded = await calls.addSlot(slotTime);
    if (slotAdded) {
      isLoading(false);
      await getAllSlotTimes();
      return true;
    }
    isLoading(false);

    return false;
  }

  Future<bool> deleteSlot(String id) async {
    isLoading(true);
    bool slotDeleted = await calls.deleteSlot(id);
    if (slotDeleted) {
      isLoading(false);
      getSlots.removeWhere((element) => element.id == id);
      return true;
    }
    isLoading(false);
    return false;
  }

  Future<bool> assignSlot(Student student, var date, var slotTime) async {
    isLoading(true);
    Student? stud = await calls.assignSlot(student, date, slotTime);
    if (stud != null) {
      isLoading(false);
      return true;
    }
    isLoading(false);
    return false;
  }
}
