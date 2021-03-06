import 'package:flutter_playground/src/about_page/domain/datasource/about_datasource_interface.dart';
import 'package:flutter_playground/src/about_page/domain/model/about_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/about_page_mock.dart';

class LocalDataSourceMock extends Mock implements IAboutDataSource {}

void main() {
  late LocalDataSourceMock dataSourceMock;

  setUp(() {
    SharedPreferences.setMockInitialValues(jsonResponse);
    dataSourceMock = LocalDataSourceMock();
  });

  test(
    'GIVEN valid about model WHEN save model on SharedPreferences THEN answer with valid value',
    () async {
      //Given
      when(() => dataSourceMock.getModel()).thenAnswer(
        (_) => Future.value(modelMock),
      );

      //When
      AboutModel? recoveredModel = await dataSourceMock.getModel();

      //Then
      expect(recoveredModel, modelMock);
    },
  );

  test(
    'GIVEN null about model WHEN save model on SharedPreferences THEN answer with null value',
    () async {
      //Given
      when(() => dataSourceMock.getModel()).thenAnswer(
        (_) => Future.value(null),
      );

      //When
      AboutModel? recoveredModel = await dataSourceMock.getModel();

      //Then
      expect(recoveredModel, null);
    },
  );
}
