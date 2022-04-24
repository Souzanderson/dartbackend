import 'dart:io';
import 'parser_exension.dart';

class CustonEnv {
  static Map<String, String> _map = {};

  static Future<Type> get<Type>({required String key}) async {
    if (_map.isEmpty) await _load();
    return _map[key]!.toType(Type);
  }

  static Future<String> _readFile() async {
    return await File('.env').readAsString();
  }

  static Future<void> _load() async {
    var lines = (await _readFile()).split('\n');
    _map = {for (var l in lines) l.split('=')[0]: l.split('=')[1]};
    print(_map);
  }
}
