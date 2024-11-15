import 'package:flutter/material.dart';
import 'package:kitties_app/models/cat.dart';


class CatDetailScreen extends StatelessWidget {
  final Cat cat;

  const CatDetailScreen({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name ?? 'No tengo nombre :( '),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (cat.image!.url != null)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    cat.image!.url!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(height: 16.0),
            Text(
              'Description',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 8.0),
            Text(cat.description ?? 'No tengo descripción'),
            SizedBox(height: 16.0),
            Text(
              'Temperament',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 8.0),
            Text(cat.temperament ?? 'No tengo temperamento'),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Origin',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 4.0),
                          Text(cat.origin ?? 'No tengo origen'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Life Span',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 4.0),
                          Text('${cat.lifeSpan} years'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}