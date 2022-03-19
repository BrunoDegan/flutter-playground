import 'package:flutter_playground/src/common/strings_constants.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/list_model.dart';

const String lorenIpsum =
    """Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum""";

List<FlutterandoListModel> flutterandoItens = [
  FlutterandoListModel(
    imageUrl: "assets/flutterando_screen/animation_icon.png",
    title: flutterandoAnimationTitle,
    subtitle: flutterandoSubtitle1,
    counter: 4,
  ),
  FlutterandoListModel(
    imageUrl: "assets/flutterando_screen/leitura_mockup_icon.png",
    title: flutterandoMockupRead,
    subtitle: flutterandoSubtitle2,
    counter: 2,
  ),
  FlutterandoListModel(
    imageUrl: "assets/flutterando_screen/playground_icon.png",
    title: flutterandoPlayground,
    subtitle: flutterandoSubtitle3,
    counter: 3,
  ),
];
