import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[900],
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Column(
        children: [
          const SearchField(icon: Icons.search, label: 'Enter destination'),
          const SizedBox(height: 8),
          DateField(
              icon: Icons.calendar_today,
              label: 'Select dates'), // Updated field for date picker
          const SizedBox(height: 8),
          const SearchField(
              icon: Icons.people, label: '1 room · 2 adults · No children'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle Search button click
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Search', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  final IconData icon;
  final String label;

  const SearchField({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[800],
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}

class DateField extends StatefulWidget {
  final IconData icon;
  final String label;

  const DateField({required this.icon, required this.label, super.key});

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTimeRange? selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTimeRange? picked = await showDateRangePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.dark(
                  primary: Colors.blue, // Header background color
                  onPrimary: Colors.black, // Header text color
                  surface: Colors.grey, // Calendar background
                  onSurface: Colors.black, // Calendar text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue, // Button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );
        if (picked != null) {
          setState(() {
            selectedDateRange = picked;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[800],
        ),
        child: Row(
          children: [
            Icon(widget.icon, color: Colors.grey),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                selectedDateRange == null
                    ? widget.label
                    : '${selectedDateRange!.start.day}/${selectedDateRange!.start.month} - ${selectedDateRange!.end.day}/${selectedDateRange!.end.month}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
