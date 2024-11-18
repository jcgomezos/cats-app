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
      body: Column(
        children: [
          // Image section: occupies half of the screen height
          if (cat.image!.url != null)
            Container(
              height: MediaQuery.of(context).size.height * 0.5, // Image takes up half the screen height
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  cat.image!.url!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          // Scrollable content below the image
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
          ),
        ],
      ),
    );
  }
}
