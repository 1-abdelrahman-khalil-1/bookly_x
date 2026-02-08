import 'dart:convert';

import 'package:flutter/services.dart' as root_bundle;

Future<Map<String, dynamic>> fetchLocalJson({required String filePath}) async {
  //read json file
  final jsonData = await root_bundle.rootBundle.loadString(filePath);
  //decode json data as map
  return await json.decode(jsonData) as Map<String, dynamic>;
}
