import 'package:flutter/material.dart';
import 'package:newzify/features/home/models/request_query.dart';
import 'package:newzify/utility/news_texts.dart';

class QueryWidget extends StatefulWidget {
  const QueryWidget({super.key});

  @override
  State<QueryWidget> createState() => _QueryWidgetState();
}

class _QueryWidgetState extends State<QueryWidget> {
  RequestQuery requestQuery = RequestQuery("in", "general", "");
  String categoryHintText = "Category";
  String countryHintText = "Country";

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter Query',
                contentPadding: EdgeInsets.all(16.0),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DropdownButton<String>(
                    dropdownColor: Theme.of(context).colorScheme.background,
                    underline: const SizedBox(),
                    isExpanded: true,
                    hint: Text(
                      countryHintText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    items:
                        NewsTexts.countryList().keys.map((String countryName) {
                      return DropdownMenuItem<String>(
                        value: countryName,
                        child: Text(countryName),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        countryHintText =
                            newValue ?? 'Country'; // Update hint text
                      });
                      requestQuery.country =
                          (NewsTexts.countryList()[newValue] ??
                              NewsTexts.countryList()['India'])!;
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context)
                        .colorScheme
                        .surface, // Background color
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DropdownButton<String>(
                    dropdownColor: Theme.of(context).colorScheme.secondary,
                    underline: const SizedBox(),
                    isExpanded: true,
                    hint: Text(
                      categoryHintText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    items: NewsTexts.categoryList().map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value.substring(0, 1).toUpperCase() +
                              value.substring(1),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        categoryHintText =
                            newValue!.substring(0, 1).toUpperCase() +
                                newValue.substring(1); // Update hint text
                      });
                      requestQuery.category =
                          newValue ?? NewsTexts.categoryList()[0];
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: Colors.green.shade100.withAlpha(100),
            ),
            onPressed: () async {
              requestQuery.query = _controller.text;
              // widget.homeCubit.getTopHeadlines(requestQuery: requestQuery);
            },
            child: Text(
              NewsTexts.get()['search'],
              style: const TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
