class Teacher {
  String? id;
  String? name;
  String? employee_type;
  String? photo;
  String? card_id;

  Teacher({this.id, this.name, this.employee_type, this.photo, this.card_id});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    employee_type = json['employee_type'];
    photo = json['photo'];
    card_id = json['card_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['employee_type'] = employee_type;
    data['photo'] = photo;
    data['card_id'] = card_id;
    return data;
  }
}

class ListTeacher {
  List<Teacher>? teacher;

  ListTeacher({this.teacher});

  ListTeacher.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      teacher = <Teacher>[];
      json['data'].forEach((v) {
        teacher!.add(Teacher.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (teacher != null) {
      data['data'] = teacher!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
