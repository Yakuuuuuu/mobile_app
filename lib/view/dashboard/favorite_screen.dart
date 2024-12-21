import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favoriteLists = [];

  void _createList() {
    showDialog(
      context: context,
      builder: (context) {
        String newListName = "";
        return AlertDialog(
          title: const Text("Create New List"),
          content: TextField(
            onChanged: (value) {
              newListName = value;
            },
            decoration: const InputDecoration(
              hintText: "Enter list name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (newListName.isNotEmpty) {
                  setState(() {
                    favoriteLists.add(newListName);
                  });
                }
                Navigator.pop(context);
              },
              child: const Text("Create"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Your Favorites",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              children: const [
                Icon(Icons.favorite_border, color: Colors.blue),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Keep track of stays you like",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Log in or create an account",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          Expanded(
            child: favoriteLists.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        size: 100,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Your list",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Text("(0 stays)",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  )
                : ListView.builder(
                    itemCount: favoriteLists.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(favoriteLists[index]),
                        leading: const Icon(Icons.folder, color: Colors.blue),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              favoriteLists.removeAt(index);
                            });
                          },
                        ),
                        onTap: () {
                          // Open the list
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createList,
        label: const Text("Create list"),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
