class Brother {
  int? id;
  String? name;
  int? points;

  Brother({this.id, this.name, this.points});

  factory Brother.fromJson(Map<String, dynamic> json) => Brother(
    id: json['id'] as int?,
    name: json['name'] as String?,
    points: json['points'] as int?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'points': points};
}
