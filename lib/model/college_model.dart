class CollegeModel {
  int? id;
  String name;
  String description;
  String location;
  int star;

  CollegeModel({
    this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.star,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'star': star,
    };
  }

  factory CollegeModel.fromMap(Map<String, dynamic> map) {
    return CollegeModel(
      id: map['id'] as int?,
      name: map['name'] as String? ?? '',
      description: map['description'] as String? ?? '',
      location: map['location'] as String? ?? '',
      star: (map['star'] as num?)?.toInt() ?? 0,
    );
  }
}