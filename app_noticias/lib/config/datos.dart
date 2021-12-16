import 'dart:math';

enum CategoriaEnum { business, entertainment, general, health, science, sports, technology }

String getKey() {
  return "eb74a7c1ce784256afcfffc0d5265300";
}

String getBaseUrl() {
  return "https://newsapi.org";
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
