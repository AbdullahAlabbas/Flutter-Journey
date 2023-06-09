import 'package:flutter/material.dart';
import 'Quote.dart';

void main() {
  runApp(const MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
        author: 'Oscar Wilde',
        text: 'Be yourself; everyone else is already taken'),
    Quote(
        author: 'Oscar Wilde',
        text: 'I have nothing to declare except my genius'),
    Quote(
        author: 'Oscar Wilde',
        text: 'The truth is rarely pure and never simple')
  ];

Widget card_template(Quote) {
    return QuoteCard(Quote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Quote App'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: quotes
            .map((quote) => card_template(quote))
            .toList(),
      ),
    );
  }
}


class QuoteCard extends StatelessWidget {
  final Quote? quote; //no changes with final
  QuoteCard(z, {this.quote});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              /* Using the method to turn a list into a Text widget,
              "{}" and "$", I was able to get this working by adding
              the "?" at the end of "quote" which is basically telling
              the program to access "text" in the Quote class only if
              it is not a null. In other words, this is making the access
              conditional */
              '${quote?.text}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              '${quote?.author}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            )
          ],
        ),
      ),
    );
  }
}
