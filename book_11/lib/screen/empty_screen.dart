import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  GestureTapCallback onSelectPressed;
  String title;
  EmptyScreen({required this.title, required this.onSelectPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xFF2A3A7C),
            Color(0xFF000118),
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Logo(
            onPressed: onSelectPressed,
          ),
          _AppName(
            title: title,
          ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  GestureTapCallback onPressed;

  _Logo({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset('asset/img/logo.png'),
    );
  }
}

class _AppName extends StatelessWidget {
  String title;
  _AppName({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
        color: Colors.white, fontSize: 26.0, fontWeight: FontWeight.w300);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Video',
          style: textStyle,
        ),
        Text(
          title,
          style: textStyle.copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

