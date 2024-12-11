import 'package:flutter/material.dart';

class SnackBarView extends StatelessWidget {
  const SnackBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(

                const SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text('Button 1'),
                  duration: Duration(seconds: 3),
                ),
              );
            },
            child: Text('Button 1'),
          ),
          SizedBox(height: 20), 
          ElevatedButton(onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(

                const SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text('Button 2'),
                  duration: Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,

                ),
              );
            },
            child: Text('Button 2'),
          ),
        ],
      ),
    );
  }
}