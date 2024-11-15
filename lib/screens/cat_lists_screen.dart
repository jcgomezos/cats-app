import 'package:flutter/material.dart';
import 'package:kitties_app/models/cat_response.dart';
import 'package:kitties_app/screens/cat_detail_screen.dart';
import 'package:kitties_app/services/cat_service.dart';

class CatListScreen extends StatefulWidget {
  @override
  _CatListScreenState createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  final CatService _catService = CatService();
  List<CatResponse> _cats = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadCats();
  }

  Future<void> _loadCats() async {
    try {
      final cats = await _catService.getCats();
      setState(() {
        _cats = cats;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Breeds'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : RefreshIndicator(
                  onRefresh: _loadCats,
                  child: ListView.builder(
                    itemCount: _cats.length,
                    itemBuilder: (context, index) {
                      final cat = _cats[index];
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CatDetailScreen(cat: cat),
                              ),
                            );
                          },
                          leading: cat.url != null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(cat.url!),
                                )
                              : CircleAvatar(
                                  child: Text(cat.breeds![0].name??'Me llamo ...'),
                                ),
                          title: Text(cat.breeds![0].name??'Me llamo ...'),
                          subtitle: Text(cat.breeds![0].countryCode??''),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}