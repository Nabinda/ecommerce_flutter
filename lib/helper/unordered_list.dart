import 'package:flutter/material.dart';

class UnorderedList extends StatelessWidget {
  final List<String> texts;
  final TextStyle style;
  const UnorderedList({Key? key,required this.texts,required this.style}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      widgetList.add(UnorderedListItem(text: text,style: style,));
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  final String text;
  final TextStyle style;
  const UnorderedListItem({Key? key,required this.text,required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("• ",style: TextStyle(fontSize: 16),),
        Expanded(
          child: Text(text,style: style,),
        ),
      ],
    );
  }
}