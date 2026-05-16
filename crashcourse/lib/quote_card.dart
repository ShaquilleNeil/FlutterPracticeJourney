
import 'package:crashcourse/quote.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function()? delete;

  const QuoteCard({super.key, required this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              quote.text,
              style: TextStyle(fontSize: 18, color: Colors.deepPurpleAccent),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              '- ${quote.author}',
              style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 245, 76, 57), fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            TextButton.icon(
              onPressed: delete,
              icon: Icon(Icons.delete, color: Colors.redAccent),
              label: Text('Delete'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.redAccent,
                side: BorderSide(color: Colors.redAccent, width: 2),
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}