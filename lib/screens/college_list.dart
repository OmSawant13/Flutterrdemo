import 'package:flutter/material.dart';
import '../model/college_model.dart';
import '../services/sqflite_db_service.dart';

class CollegeList extends StatefulWidget {
  const CollegeList({super.key});

  @override
  State<CollegeList> createState() => _CollegeListState();
}

class _CollegeListState extends State<CollegeList> {
  List<CollegeModel> colleges = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCollegeData();
  }

  Future<void> loadCollegeData() async {
    final data = await DbService.instance.getAllColleges();
    if (mounted) {
      setState(() {
        colleges = data;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('College List'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : colleges.isEmpty
              ? const Center(
                  child: Text(
                    'No colleges found',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : ListView.builder(
                  itemCount: colleges.length,
                  itemBuilder: (context, index) {
                    final college = colleges[index];
                    return ListTile(
                      title: Text(college.name),
                      subtitle: Text(college.location),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.visibility),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.settings),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}