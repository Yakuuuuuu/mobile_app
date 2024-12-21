import 'package:flutter/material.dart';

class FAQDetailsScreen extends StatelessWidget {
  final String title;
  final List<String> details;

  const FAQDetailsScreen({
    super.key,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: details.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              details[index],
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              // Add further navigation or actions here if required
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(details[index]),
                  content: const Text('More details about this topic...'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
