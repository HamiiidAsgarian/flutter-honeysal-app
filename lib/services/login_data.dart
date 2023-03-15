Future<Map<String, dynamic>> logInDataPost(dynamic response) async {
  await Future.delayed(const Duration(seconds: 1));

  if (response == true) {
    return {"status": 200};
  }
  return {"status": 400};
}

Future<Map<String, dynamic>> signUpDataPost(dynamic response) async {
  await Future.delayed(const Duration(seconds: 1));

  if (response == true) {
    return {"status": 200};
  }
  return {"status": 400};
}
