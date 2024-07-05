import 'dart:convert';

// To parse this JSON data, do
//
//     final information = informationFromJson(jsonString);

Information informationFromJson(String str) =>
    Information.fromJson(json.decode(str));

String informationToJson(Information data) => json.encode(data.toJson());

class Information {
  Information({
    this.id,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.gender,
    this.photo,
    this.parent,
    this.classeRoom,
    this.activities,
  });

  String? id;
  String? firstName;
  String? lastName;
  DateTime? birthDate;
  String? gender;
  String? photo;
  Parent? parent;
  ClasseRoom? classeRoom;
  List<ActivityElement>? activities;

  factory Information.fromJson(Map<String, dynamic> json) => Information(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        birthDate: DateTime.parse(json["BirthDate"]),
        gender: json["gender"],
        photo: json["photo"],
        parent: Parent.fromJson(json["parent"]),
        classeRoom: ClasseRoom.fromJson(json["classeRoom"]),
        activities: List<ActivityElement>.from(
            json["activities"].map((x) => ActivityElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "BirthDate": birthDate!.toIso8601String(),
        "gender": gender,
        "photo": photo,
        "parent": parent!.toJson(),
        "classeRoom": classeRoom!.toJson(),
        "activities": List<dynamic>.from(activities!.map((x) => x.toJson())),
      };
}

class ActivityElement {
  ActivityElement({
    this.id,
    this.inscription,
    this.activity,
    this.months,
  });

  String? id;
  bool? inscription;
  ActivityActivity? activity;
  Map<String, bool>? months;

  factory ActivityElement.fromJson(Map<String, dynamic> json) =>
      ActivityElement(
        id: json["_id"],
        inscription: json["inscription"],
        activity: ActivityActivity.fromJson(json["activity"]),
        months: Map.from(json["months"])
            .map((k, v) => MapEntry<String, bool>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "inscription": inscription,
        "activity": activity!.toJson(),
        "months":
            Map.from(months!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class ActivityActivity {
  ActivityActivity({
    this.name,
    this.inscription,
  });

  String? name;
  dynamic inscription;

  factory ActivityActivity.fromJson(Map<String, dynamic> json) =>
      ActivityActivity(
        name: json["name"],
        inscription: json["inscription"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "inscription": inscription,
      };
}

class ClasseRoom {
  ClasseRoom({
    this.name,
    this.id,
    this.months,
  });

  String? name;
  String? id;
  Map<String, bool>? months;

  factory ClasseRoom.fromJson(Map<String, dynamic> json) => ClasseRoom(
        name: json["name"],
        id: json["_id"],
        months: Map.from(json["months"])
            .map((k, v) => MapEntry<String, bool>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "_id": id,
        "months":
            Map.from(months!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Parent {
  Parent({
    this.id,
    this.mother,
    this.father,
    this.adress,
  });

  String? id;
  ParentInfo? mother;
  ParentInfo? father;
  String? adress;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["_id"],
        mother: ParentInfo.fromJson(json["mother"]),
        father: ParentInfo.fromJson(json["father"]),
        adress: json["adress"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "mother": mother!.toJson(),
        "father": father!.toJson(),
        "adress": adress,
      };
}

class ParentInfo {
  ParentInfo({
    this.firstName,
    this.lastName,
    this.phone,
    this.job,
  });

  String? firstName;
  String? lastName;
  dynamic phone;
  String? job;

  factory ParentInfo.fromJson(Map<String, dynamic> json) => ParentInfo(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "job": job,
      };
}
