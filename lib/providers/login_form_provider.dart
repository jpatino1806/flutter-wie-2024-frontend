import 'package:flutter/material.dart';
import 'package:flutter_dignal_2025/services/my_server.dart';
import 'package:http/http.dart' as http;

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';

  bool _isLoading = false;
  get isLoading => _isLoading;
  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  bool validate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }

  login() async {
    _isLoading = true;
    notifyListeners();

    //http://localhost:88 /api/login
    // var url = Uri.http('192.168.100.16:88', '/api/login');
    // var response = await http.post(url, body: {
    //   'username': username,
    //   'password': password
    // });

    final response =await MyServer().login(
      username: username,
      password: password
    );
   
    _isLoading = false;
    notifyListeners();
    return response;
  }
}
