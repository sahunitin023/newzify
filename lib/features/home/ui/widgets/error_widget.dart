import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utility/news_texts.dart';

class ErrorResponseWidget extends StatelessWidget {
  const ErrorResponseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
        child: ListView(
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/error.svg',
              fit: BoxFit.contain,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                NewsTexts.get()['anErrorOccurred'],
                style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
