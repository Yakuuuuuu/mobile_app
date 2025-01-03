import 'package:flutter/material.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey,
          ),
          child: const Icon(Icons.image, color: Colors.white), // Placeholder
        ),
        title: const Text(
          'Save on stays worldwide',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: const Text(
          'Escape with Early 2025 Deals',
          style: TextStyle(color: Colors.grey),
        ),
        trailing: TextButton(
          onPressed: () {
            // Handle "Find your deal"
          },
          child: const Text('Find your deal',
              style: TextStyle(color: Colors.blue)),
        ),
      ),
    );
  }
}
