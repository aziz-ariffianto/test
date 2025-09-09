import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '0';
  String _expression = '';
  double _result = 0.0;
  String _operation = '';
  double _operand1 = 0.0;
  bool _waitingForOperand = false;

  void _onDigitPressed(String digit) {
    setState(() {
      if (_waitingForOperand) {
        _display = digit;
        _waitingForOperand = false;
      } else {
        _display = _display == '0' ? digit : _display + digit;
      }
    });
  }

  void _onOperationPressed(String operation) {
    setState(() {
      if (!_waitingForOperand) {
        if (_operation.isNotEmpty) {
          _calculate();
        } else {
          _operand1 = double.parse(_display);
        }
      }
      _operation = operation;
      _waitingForOperand = true;
      _expression = '$_operand1 $operation';
    });
  }

  void _calculate() {
    double operand2 = double.parse(_display);
    double result = 0.0;

    switch (_operation) {
      case '+':
        result = _operand1 + operand2;
        break;
      case '-':
        result = _operand1 - operand2;
        break;
      case '×':
        result = _operand1 * operand2;
        break;
      case '÷':
        result = operand2 != 0 ? _operand1 / operand2 : 0.0;
        break;
    }

    _operand1 = result;
    _display = result.toString();
    
    // Clean up display for whole numbers
    if (result == result.toInt()) {
      _display = result.toInt().toString();
    }
  }

  void _onEqualsPressed() {
    setState(() {
      if (_operation.isNotEmpty && !_waitingForOperand) {
        _calculate();
        _expression = '';
        _operation = '';
        _waitingForOperand = true;
      }
    });
  }

  void _onClearPressed() {
    setState(() {
      _display = '0';
      _expression = '';
      _result = 0.0;
      _operation = '';
      _operand1 = 0.0;
      _waitingForOperand = false;
    });
  }

  void _onDecimalPressed() {
    setState(() {
      if (_waitingForOperand) {
        _display = '0.';
        _waitingForOperand = false;
      } else if (!_display.contains('.')) {
        _display = _display + '.';
      }
    });
  }

  Widget _buildButton(String text, {Color? color, Color? textColor, VoidCallback? onPressed}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Theme.of(context).colorScheme.surface,
            foregroundColor: textColor ?? Theme.of(context).colorScheme.onSurface,
            padding: const EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Display area
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (_expression.isNotEmpty)
                    Text(
                      _expression,
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    _display,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Button area
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Row 1: Clear and operations
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton(
                          'C',
                          color: Theme.of(context).colorScheme.error,
                          textColor: Theme.of(context).colorScheme.onError,
                          onPressed: _onClearPressed,
                        ),
                        _buildButton(''),
                        _buildButton(''),
                        _buildButton(
                          '÷',
                          color: Theme.of(context).colorScheme.primary,
                          textColor: Theme.of(context).colorScheme.onPrimary,
                          onPressed: () => _onOperationPressed('÷'),
                        ),
                      ],
                    ),
                  ),
                  // Row 2: 7, 8, 9, ×
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('7', onPressed: () => _onDigitPressed('7')),
                        _buildButton('8', onPressed: () => _onDigitPressed('8')),
                        _buildButton('9', onPressed: () => _onDigitPressed('9')),
                        _buildButton(
                          '×',
                          color: Theme.of(context).colorScheme.primary,
                          textColor: Theme.of(context).colorScheme.onPrimary,
                          onPressed: () => _onOperationPressed('×'),
                        ),
                      ],
                    ),
                  ),
                  // Row 3: 4, 5, 6, -
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('4', onPressed: () => _onDigitPressed('4')),
                        _buildButton('5', onPressed: () => _onDigitPressed('5')),
                        _buildButton('6', onPressed: () => _onDigitPressed('6')),
                        _buildButton(
                          '-',
                          color: Theme.of(context).colorScheme.primary,
                          textColor: Theme.of(context).colorScheme.onPrimary,
                          onPressed: () => _onOperationPressed('-'),
                        ),
                      ],
                    ),
                  ),
                  // Row 4: 1, 2, 3, +
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('1', onPressed: () => _onDigitPressed('1')),
                        _buildButton('2', onPressed: () => _onDigitPressed('2')),
                        _buildButton('3', onPressed: () => _onDigitPressed('3')),
                        _buildButton(
                          '+',
                          color: Theme.of(context).colorScheme.primary,
                          textColor: Theme.of(context).colorScheme.onPrimary,
                          onPressed: () => _onOperationPressed('+'),
                        ),
                      ],
                    ),
                  ),
                  // Row 5: 0, ., =
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.surface,
                                foregroundColor: Theme.of(context).colorScheme.onSurface,
                                padding: const EdgeInsets.all(20.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () => _onDigitPressed('0'),
                              child: const Text(
                                '0',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        _buildButton('.', onPressed: _onDecimalPressed),
                        _buildButton(
                          '=',
                          color: Theme.of(context).colorScheme.secondary,
                          textColor: Theme.of(context).colorScheme.onSecondary,
                          onPressed: _onEqualsPressed,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
