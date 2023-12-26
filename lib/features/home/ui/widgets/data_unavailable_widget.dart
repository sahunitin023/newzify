import 'package:flutter/material.dart';
import '../../../../utility/news_texts.dart';

class DataUnavailableWidget extends StatelessWidget {
  const DataUnavailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Text(
        NewsTexts.get()['emptyQuery'],
        style: TextStyle(
            color: Theme.of(context).colorScheme.error,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
