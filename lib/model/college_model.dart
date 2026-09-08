class CollegeModel {
  int? id;
  String name;
  String description;
  String location;
  String start;

  CollegeModel({
    this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.start,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'start': start,
    };
  }
  factory CollegeModel.fromMap(Map<String, dynamic> map) {
    return CollegeModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      location: map['location'],
      start: map['start'],
    );
  }
}