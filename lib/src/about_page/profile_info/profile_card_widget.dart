import 'package:flutter/material.dart';
import 'package:flutter_playground/src/about_page/domain/model/about_model.dart';

class ProfileCardWidget extends StatefulWidget {
  final AboutModel model;
  const ProfileCardWidget({Key? key, required this.model}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AboutCardState();
}

class _AboutCardState extends State<ProfileCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
        shape: BoxShape.rectangle,
        color: Color(0xFF172026),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 13.0),
            child: Container(
              width: 116,
              height: 116,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(widget.model.userImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),
            child: Text(
              widget.model.userName,
              style: const TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins-Medium',
                fontStyle: FontStyle.normal,
                color: Color(0xFFEDF4F8),
                fontSize: 16.0,
              ),
            ),
          ),
          Text(
            widget.model.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Poppins-Medium',
              color: Color(0xFF51565A),
              fontStyle: FontStyle.normal,
              fontSize: 12.0,
            ),
          ),
          Padding(
            child: _aboutContactRow(),
            padding: const EdgeInsets.only(top: 42.5, bottom: 26),
          )
        ],
      ),
    );
  }

  _aboutContactRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/flutterando_screen/whatsapp.png',
              fit: BoxFit.cover),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/flutterando_screen/github.png',
              fit: BoxFit.cover),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/flutterando_screen/instagram.png',
              fit: BoxFit.cover),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/flutterando_screen/facebook.png',
              fit: BoxFit.cover),
        ),
      ],
    );
  }
}
