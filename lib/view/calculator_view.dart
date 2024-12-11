import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final _textController = TextEditingController();
  List<String> lstSymbols = [
    "C",
    "*",
    "/",
    "<-",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "%",
    "0",
    ".",
    "=",
  ];

  final _key = GlobalKey<FormState>();
  String displayText = ""; // Current input/output value
  String previousText = ""; // Previous input for operations
  String operation = ""; // Current operation

  void _handleButtonPress(String value) {
    setState(() {
      if (value == "C") {
        // Clear everything
        displayText = "";
        previousText = "";
        operation = "";
      } else if (value == "<-") {
        // Backspace functionality
        if (displayText.isNotEmpty) {
          displayText = displayText.substring(0, displayText.length - 1);
        }
      } else if (value == "=") {
        // Evaluate the expression
        _evaluateExpression();
      } else if (value == "+" ||
          value == "-" ||
          value == "*" ||
          value == "/" ||
          value == "%") {
        // Operator pressed
        if (displayText.isNotEmpty && operation.isEmpty) {
          previousText = displayText; // Save the current number
          operation = value; // Set the operation
          displayText += " $value "; // Append operator to the display
        }
      } else {
        // Append numbers or symbols to the display
        displayText += value;
      }
      _textController.text = displayText; // Update text field
    });
  }

  void _evaluateExpression() {
    if (previousText.isNotEmpty &&
        displayText.isNotEmpty &&
        operation.isNotEmpty) {
      // Extract the second number from the display
      String currentInput = displayText.split(operation).last.trim();
      double num1 = double.tryParse(previousText) ?? 0.0;
      double num2 = double.tryParse(currentInput) ?? 0.0;
      double result;

      // Perform the calculation
      switch (operation) {
        case "+":
          result = num1 + num2;
          break;
        case "-":
          result = num1 - num2;
          break;
        case "*":
          result = num1 * num2;
          break;
        case "/":
          result =
              num2 != 0 ? num1 / num2 : double.nan; // Handle division by zero
          break;
        case "%":
          result = num1 % num2;
          break;
        default:
          result = 0.0;
      }

      // Update display with the full equation and result
      if (result.isNaN) {
        displayText = "Error";
      } else {
        displayText = "$previousText $operation $currentInput = $result";
      }

      // Reset the operation and previous number
      operation = "";
      previousText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                readOnly: true, // Make the text field read-only
                textAlign: TextAlign.right, // Align text to the right
              ),
              const SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: lstSymbols.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () => _handleButtonPress(lstSymbols[index]),
                      child: Text(
                        lstSymbols[index],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}