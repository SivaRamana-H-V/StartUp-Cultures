// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> data = [
    "HTML3",
    "CSS3",
    "JavaScript",
    "Python",
    "Java",
    "Flutter",
    "Web development",
    "App Development"
  ];
  List<String> searchResults = [];
  String query = '';

  void onQueryChanged(String newQuery) {
    setState(() {
      query = newQuery;
      searchResults = data
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        title: Text(
          'Search Screen',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Column(
        children: [
          SearchBar(onQueryChanged: onQueryChanged),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final Function(String) onQueryChanged;

  const SearchBar({super.key, required this.onQueryChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 430,
          padding: const EdgeInsets.all(16),
          child: TextField(
            onChanged: onQueryChanged,
            decoration: InputDecoration(
              labelText: 'Search',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }
}
