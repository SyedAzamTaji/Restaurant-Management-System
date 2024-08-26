import 'dart:io';

String? username;
String? password;
signup() {
  print("Enter username: ");
  username = stdin.readLineSync()!;
  print("Enter password: ");
  password = stdin.readLineSync()!;
  print("Signup successfully! Now Login");
}

bool login() {
  print("Enter username: ");
  String inputUsername = stdin.readLineSync()!;
  print("Enter password: ");
  String inputPassword = stdin.readLineSync()!;

  if (inputUsername == username && inputPassword == password) {
    print("Login successfully!");
    return true;
  } else {
    print("Invalid credentials!");
    return false;
  }
}
