class Attendance {
  int? id;
  String? school_id;
  String? name;
  String? photo;
  String? employee_type;
  String? cardId;
  String? createdAt;

  Attendance({
    this.id,
    this.school_id,
    this.name,
    this.photo,
    this.employee_type,
    this.cardId,
    this.createdAt,
  });

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    school_id = json['student_id'];
    name = json['name'];
    photo = json['photo'];
    employee_type = json['employee_type'];
    cardId = json['card_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['student_id.employee_type'] = school_id;
    data['name'] = name;
    data['photo'] = photo;
    data['employee_type'] = employee_type;
    data['card_id'] = cardId;
    data['created_at'] = createdAt;
    return data;
  }
}
