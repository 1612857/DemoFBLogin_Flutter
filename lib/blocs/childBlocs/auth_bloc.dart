

import 'package:flutter_widget_tot/apis/net/auth_repository.dart';
import 'package:flutter_widget_tot/models/user.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  User _userData; 
  String _token;
  AuthRepository _authRepository;

  BehaviorSubject userDataSubject = new BehaviorSubject<User>();
  BehaviorSubject tokenSubject = new BehaviorSubject<String>();
  
  Observable get userDataObservable => userDataSubject.stream;
  Observable get tokenObservable => tokenSubject.stream;
  
  AuthBloc() {
    _authRepository = new AuthRepository();
    _userData = new User('123', 'email', 'name', 'dob', 'avatar', 'skills', 'position', 'joinDate');
    _token = "";

  }



  updateUserData() {
    userDataSubject.sink.add(User('id', 'email', 'name', 'dob', 'avatar', 'skills', 'position', 'joinDate'));
  }

  updateToken() {
    tokenSubject.sink.add("foqdhqiheiuq euqeguq geuiqe kqeopkq opejq ejq");
  }

  dispose() {
    userDataSubject.close();
    tokenSubject.close();
  }

}