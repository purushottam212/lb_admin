// To parse this JSON data, do
//
//     final slotTimeModel = slotTimeModelFromJson(jsonString);

import 'dart:convert';

List<SlotTimeModel> slotTimeModelFromJson(String str) =>
    List<SlotTimeModel>.from(
        json.decode(str).map((x) => SlotTimeModel.fromJson(x)));

String slotTimeModelToJson(List<SlotTimeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SlotTimeModel {
  SlotTimeModel({
    this.id,
    this.slotTime,
  });

  String? id;
  String? slotTime;

  factory SlotTimeModel.fromJson(Map<String, dynamic> json) => SlotTimeModel(
        id: json["id"],
        slotTime: json["slotTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slotTime": slotTime,
      };
}
