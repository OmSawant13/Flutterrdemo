import 'package:flutter_test/flutter_test.dart';
import 'package:college_data_with_sqflite_database/model/college_model.dart';

void main() {
  test('CollegeModel serialization and deserialization test', () {
    final college = CollegeModel(
      id: 1,
      name: 'Engineering College',
      description: 'Top tier institute',
      location: 'Mumbai',
      star: 5,
    );

    final map = college.toMap();
    expect(map['id'], 1);
    expect(map['name'], 'Engineering College');
    expect(map['star'], 5);

    final parsed = CollegeModel.fromMap(map);
    expect(parsed.id, 1);
    expect(parsed.name, 'Engineering College');
    expect(parsed.star, 5);
  });
}
