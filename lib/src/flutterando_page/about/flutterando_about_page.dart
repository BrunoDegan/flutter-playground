import 'package:flutter/material.dart';
import 'package:flutter_playground/src/flutterando_page/about/favorites/favorites_widget.dart';
import 'package:flutter_playground/src/flutterando_page/about/profile_info/profile_card_widget.dart';
import 'package:flutter_playground/src/flutterando_page/about/skills/skills_widget.dart';
import 'package:flutter_playground/src/flutterando_page/about/store/about_screen_store.dart';
import 'package:flutter_playground/src/common/page_state.dart';
import 'package:flutter_playground/src/flutterando_page/view/widgets/flutterando_top_bar_widget.dart';
import 'package:provider/provider.dart';

import '../states/about_page_state.dart';

class FlutterandoAboutPage extends StatefulWidget {
  const FlutterandoAboutPage({Key? key}) : super(key: key);

  @override
  State<FlutterandoAboutPage> createState() => _FlutterandoAboutPageState();
}

class _FlutterandoAboutPageState extends State<FlutterandoAboutPage> {
  late AboutPageStore _store;

  @override
  void initState() {
    super.initState();
    _store = context.read<AboutPageStore>();
    _store.fetchAboutScreenModel();
    _store.addListener(() {
      setState(() {});
    });
  }

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
        valueListenable: _store,
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
}
