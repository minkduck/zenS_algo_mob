import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_zens_company/widgets/app_button.dart';

import '../utils/app_layout.dart';

class AlgorithmScreen extends StatefulWidget {
  const AlgorithmScreen({Key? key}) : super(key: key);

  @override
  State<AlgorithmScreen> createState() => _AlgorithmScreenState();
}

class _AlgorithmScreenState extends State<AlgorithmScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _inputError;
  List<int> _numbers = [];
  int _minSum = 0;
  int _maxSum = 0;
  int _total = 0;
  int _min = 0;
  int _max = 0;
  List<int> _even = [];
  List<int> _odd = [];

  void _calculateAlgorithm() {
    if (_numbers.length != 5) {
      setState(() {
        _inputError = 'You must input 5 numbers';
      });
      return;
    }

    // Calculate minSum and maxSum
    _numbers.sort();
    _minSum = 0;
    _maxSum = 0;
    for (int i = 0; i < _numbers.length - 1; i++) {
      _minSum += _numbers[i];
    }
    for (int i = 1; i < _numbers.length; i++) {
      _maxSum += _numbers[i];
    }

    // Calculate bonus tasks
    _total = _numbers.reduce((value, element) => value + element);
    _min =
        _numbers.reduce((value, element) => value < element ? value : element);
    _max =
        _numbers.reduce((value, element) => value > element ? value : element);
    _even = _numbers.where((element) => element % 2 == 0).toList();
    _odd = _numbers.where((element) => element % 2 != 0).toList();

    setState(() {
      _inputError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algorithm Screen'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter 5 numbers separated by spaces',
                errorText: _inputError,
              ),
              onChanged: (value) {
                setState(() {
                  _inputError = null;
                  _numbers = value
                      .split(' ')
                      .map(int.tryParse)
                      .where((num) => num != null)
                      .cast<int>()
                      .toList();
                });
              },
            ),
            Gap(AppLayout.getHeight(20)),
            ElevatedButton(
              onPressed: _numbers.length == 5 ? _calculateAlgorithm : null,
              child: Text('See Result'),
            ),
            Gap(AppLayout.getHeight(20)),
            if (_minSum != 0) Text('Minimum Sum: $_minSum'),
            if (_maxSum != 0) Text('Maximum Sum: $_maxSum'),
            if (_total != 0) Text('Total of array: $_total'),
            if (_min != 0) Text('Min in array: $_min'),
            if (_max != 0) Text('Max in array: $_max'),
            if (_even.isNotEmpty) Text('Even elements in array: $_even'),
            if (_odd.isNotEmpty) Text('Odd elements in array: $_odd'),
          ],
        ),
      ),
    );
  }
}
