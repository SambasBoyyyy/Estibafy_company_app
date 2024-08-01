import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/colors.dart';
import '../../controllers/helper_controller.dart';

class HelperRate extends StatefulWidget {
  const HelperRate({super.key});

  @override
  State<HelperRate> createState() => _HelperRateState();
}

class _HelperRateState extends State<HelperRate> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _percentageController = TextEditingController();
  double? _currentPercentage;

  final HelperController _helperController = Get.put(HelperController());

  @override
  void initState() {
    super.initState();
    _loadCurrentPercentage();
  }

  Future<void> _loadCurrentPercentage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentPercentage = prefs.getDouble('helperRate');
    });
  }

  Future<void> _savePercentage(double percentage) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('helperRate', percentage);
  }

  void _submitRate() {
    if (_formKey.currentState!.validate()) {
      final percentage = double.parse(_percentageController.text);
      _savePercentage(percentage).then((_) {
        _helperController.SetHelperRate(percentage: percentage); // Call SetHelperRate from HelperController
        setState(() {
          _currentPercentage = percentage;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Helper rate set to: $percentage%')),
        );
        _percentageController.clear();
      });
    }
  }

  @override
  void dispose() {
    _percentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Helper Rate'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_currentPercentage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'Current percentage: ${_currentPercentage!.toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              TextFormField(
                controller: _percentageController,
                decoration: InputDecoration(
                  labelText: 'Enter Percentage',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a percentage';
                  }
                  final n = num.tryParse(value);
                  if (n == null || n <= 0 || n > 100) {
                    return 'Please enter a valid percentage (1-100)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitRate,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text("Set",
                      style: TextStyle(color: AppColors.backgroundColor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
