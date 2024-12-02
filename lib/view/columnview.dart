// import 'package:flutter/material.dart';

// class ColumnView extends StatelessWidget {
//   const ColumnView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Column"),
//       ),
//       body: Container(
//         color: Colors.yellow,
//         child: const Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Icon(Icons.star, size: 50),
//             Icon(Icons.star, size: 50),
//             Icon(Icons.star, size: 50),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ColumnView extends StatelessWidget {
//   const ColumnView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Column"),
//       ),
//       body: Container(
//         color: Colors.yellow,
//         child: const Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(Icons.star, size: 50),
//             Icon(Icons.star, size: 50),
//             Icon(Icons.star, size: 50),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class ColumnView extends StatelessWidget {
  const ColumnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Column with Buttons"),
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.star, size: 50),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("First star clicked!")),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.star, size: 50),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Second star clicked!")),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.star, size: 50),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Third star clicked!")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
