import 'package:flutter/material.dart';
import 'package:flutter_dignal_2025/models/models.dart';

class DeviceFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Device device;

  DeviceFormProvider(this.device);

  Map<String, dynamic> _errors = {};
  Map<String, dynamic> get errors => _errors;
  set errors(value) {
    _errors = value;
    notifyListeners();
  }

  String _message = '';
  get message => _message;
  set message(value) {
    _message = value;
    notifyListeners();
  }

  bool _isLoading = false;
  get isLoading => _isLoading;
  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  bool validate() {
    if (formKey.currentState == null) {
      return false;
    }
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }
}
