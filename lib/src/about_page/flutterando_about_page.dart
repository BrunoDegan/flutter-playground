import 'package:flutter/material.dart';
import 'package:flutter_playground/src/about_page/favorites/favorites_widget.dart';
import 'package:flutter_playground/src/about_page/profile_info/profile_card_widget.dart';
import 'package:flutter_playground/src/about_page/skills/skills_widget.dart';
import 'package:flutter_playground/src/about_page/store/about_screen_store.dart';
import 'package:flutter_playground/src/common/complete_state_mixin.dart';
import 'package:flutter_playground/src/common/page_state.dart';
import 'package:flutter_playground/src/main_page/view/widgets/flutterando_top_bar_widget.dart';
import 'states/about_page_state.dart';

class FlutterandoAboutPage extends StatefulWidget {
  final AboutPageStore store;
  const FlutterandoAboutPage({Key? key, required this.store}) : super(key: key);

  @override
  State<FlutterandoAboutPage> createState() => _FlutterandoAboutPageState();
}

class _FlutterandoAboutPageState extends State<FlutterandoAboutPage>
    with CompleteStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _mainContainer(context),
        FlutterandoTopBarWidget(
          onTopBarButtonClickListener: () {
            //TODO
          },
        ),
      ],
    );
  }

  Widget _mainContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 100.0,
        bottom: 10.0,
      ),
      color: const Color(0xFF121517),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ValueListenableBuilder<PageState>(
        valueListenable: widget.store,
        builder: (context, value, child) {
          if (value is SuccessState) {
            return ListView(children: [
              ProfileCardWidget(
                model: value.model,
              ),
              const SizedBox(
                height: 20,
              ),
              FavoritesWidget(
                model: value.model,
              ),
              const SizedBox(
                height: 20,
              ),
              SkillsWidget(
                model: value.model,
              ),
            ]);
          } else if (value is ErrorState) {
            return const Center(
                child: Text(
              'Erro ao fazer download dos dados',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins-Medium',
                fontStyle: FontStyle.normal,
                color: Color(0xFFEDF4F8),
                fontSize: 20.0,
              ),
            ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void completeState() {
    widget.store.fetchAboutScreenModel();
  }
}
