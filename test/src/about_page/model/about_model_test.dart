import 'package:flutter/foundation.dart';
import 'package:flutter_playground/src/about_page/domain/model/about_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/about_page_mock.dart';

main() {
  late Map<String, dynamic> jsonModel;
  late AboutModel convertedModel;

  setUp(() {
    jsonModel = modelMock.toJson();
    convertedModel = AboutModel.fromJson(jsonModel);
  });

  test('GIVEN description WHEN fromJson is called THEN convert to data model',
      () {
    expect(convertedModel.description, equals(modelMock.description));
  });

  test(
      'GIVEN user image path WHEN fromJson is called THEN convert to data model',
      () {
    expect(convertedModel.userImagePath, equals(modelMock.userImagePath));
  });

  test('GIVEN user name WHEN fromJson is called THEN convert to data model',
      () {
    expect(convertedModel.userName, equals(modelMock.userName));
  });

  test('GIVEN user skills WHEN fromJson is called THEN convert to data model',
      () {
    expect(true, listEquals(convertedModel.skills, modelMock.skills));
  });

  test('GIVEN favorites WHEN fromJson is called THEN convert to data model',
      () {
    expect(true, listEquals(convertedModel.favorites, modelMock.favorites));
  });
}
