import 'package:calendarschedule/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime;
  const CustomTextField({required this.isTime, required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text(label, style:
        const TextStyle(
          color:PRIMARY_COLOR,
          fontWeight: FontWeight.w600,
        ),),
          if(isTime) renderText()
          else Expanded(child: renderText()),
    ]);
  }

  Widget renderText(){
    final textFieldColor = Colors.grey[300];
    final cursorColor = Colors.grey[500];

    return TextField(
      expands: !isTime,
      keyboardType: isTime ? TextInputType.datetime : TextInputType.multiline, // 모바일 앱 키보드 타입
      inputFormatters: isTime ? [FilteringTextInputFormatter.digitsOnly] : [], // 입력 가능한 데이터 포맷
      maxLines: isTime ? 1 : null, // 최대 줄의 개수
      cursorColor: cursorColor,
      decoration: InputDecoration(
        border: InputBorder.none, // 텍스트 필드 Border 없애기
        filled: true, // 색상 변경(fillColor)을 위한것
        fillColor: textFieldColor,
      ),
    );
  }
}


