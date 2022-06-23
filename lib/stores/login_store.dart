
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStore with _$LoginStore;


abstract class _LoginStore with Store {
  
  // _LoginStore(){fdfd

  //   autorun((_) {
  //     // print(email);
  //     // print(password);

  //     //print(isFormValid);

  //     //print(passwordVisible);

  //   });

  // }

  @observable
  Color emailFieldColor = Colors.grey;

  @observable
  Color passwordFieldColor = Colors.grey;

  @action
  void setEmailFieldColor(Color color) => emailFieldColor = color;

  @action
  void setPasswordFieldColor(Color color) => passwordFieldColor = color;

  @computed
  Color get emailFieldColorToApply => emailFieldColor;

  @computed
  Color get passwordFieldColorToApply => passwordFieldColor;


  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @action
  void tooglePasswordVisibillity() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  
  //void toggleLoading() => loading = !loading;

  Future<void> login() async {
    //toggleLoading();
    loading = true;
    
    await Future.delayed(const Duration(seconds: 2));

    //toggleLoading();
    loading = false;
    loggedIn = true;

    email = '';
    password = '';
  }

  @computed
  bool get isEmailValid => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    ).hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  // @computed
  // bool get isFormValid => isEmailValid && isPasswordValid;

  @computed
  VoidCallback? get loginPressed => 
    (isEmailValid && isPasswordValid && !loading) ? login : null;

  @action
  void logout() {
    loggedIn = false;
  }
    

  // @computed
  // Widget get buttonWidgetValue => 
  //   loading ? const CircularProgressIndicator(
  //       valueColor: AlwaysStoppedAnimation(Colors.white),
  //     )
  //   : const Text('Login');


}