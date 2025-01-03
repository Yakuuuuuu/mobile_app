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
          DateField(icon: Icons.calendar_today, label: 'Select dates'),
          const SizedBox(height: 8),
          const PersonField(
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

class PersonField extends StatefulWidget {
  final IconData icon;
  final String label;

  const PersonField({required this.icon, required this.label, super.key});

  @override
  _PersonFieldState createState() => _PersonFieldState();
}

class _PersonFieldState extends State<PersonField> {
  int rooms = 1;
  int adults = 2;
  int children = 0;

  String _getLabel() {
    return '$rooms room · $adults adults · $children children';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setStateDialog) {
                return AlertDialog(
                  backgroundColor: Colors.grey[900],
                  title: const Text(
                    'Select Details',
                    style: TextStyle(color: Colors.white),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildCounterRow('Rooms', rooms, (value) {
                        setStateDialog(() => rooms = value);
                      }),
                      _buildCounterRow('Adults', adults, (value) {
                        setStateDialog(() => adults = value);
                      }),
                      _buildCounterRow('Children', children, (value) {
                        setStateDialog(() => children = value);
                      }),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(
                            () {}); // Update widget state after confirmation
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text('Confirm'),
                    ),
                  ],
                );
              },
            );
          },
        );
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
                _getLabel(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterRow(
      String label, int value, ValueChanged<int> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        Row(
          children: [
            IconButton(
              onPressed: value > 0 ? () => onChanged(value - 1) : null,
              icon: const Icon(Icons.remove, color: Colors.grey),
            ),
            Text('$value', style: const TextStyle(color: Colors.white)),
            IconButton(
              onPressed: () => onChanged(value + 1),
              icon: const Icon(Icons.add, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
