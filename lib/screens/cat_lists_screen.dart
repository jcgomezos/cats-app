import 'package:flutter/material.dart';
import 'package:kitties_app/providers/breed_provider.dart';
import 'package:kitties_app/screens/cat_detail_screen.dart';
import 'package:kitties_app/services/cat_service.dart';
import 'package:provider/provider.dart';

class CatListScreen extends StatefulWidget {
  const CatListScreen({Key? key}) : super(key: key);

  @override
  _CatListScreenState createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  final CatService _catService = CatService();
  bool _isLoading = true;
  String? _error;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Using Future.microtask to avoid calling Provider.of during build
    Future.microtask(() => _loadCats());
  }

   @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadCats() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final breedProvider = Provider.of<BreedProvider>(context, listen: false);
      final cats = await _catService.getCats();

      if (!mounted) return;

      breedProvider.catResponse = cats;
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Filtra los gatos por su raza...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value.toLowerCase();
          });
        },
      ),
    );
  }

  List<dynamic> _getFilteredCats(List<dynamic> cats) {
    if (_searchQuery.isEmpty) {
      return cats;
    }
    return cats.where((cat) {
      final name = (cat.name ?? '').toLowerCase();
      return name.contains(_searchQuery);
    }).toList();
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            const SizedBox(height: 16),
            Text(
              'Error: $error',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadCats,
              child: const Text('Recarga la página.'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Cargando gatos...'),
        ],
      ),
    );
  }

  Widget _buildCatList(BreedProvider breedProvider) {
    final filteredCats = _getFilteredCats(breedProvider.catResponse);
    if (filteredCats.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.pets,
              size: 60,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(_searchQuery.isEmpty 
                ? 'No se encontraron gatos' 
                : 'No hay gatos de tipo "$_searchQuery"'),
            const SizedBox(height: 16),
            if (_searchQuery.isEmpty)
              ElevatedButton(
                onPressed: _loadCats,
                child: const Text('Refresca'),
              ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: filteredCats.length,
      itemBuilder: (context, index) {
        final cat = filteredCats[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatDetailScreen(cat: cat),
                ),
              );
            },
            leading: _buildCatAvatar(cat),
            title: Text(cat.name ?? 'No se conoce su nombre'),
            subtitle: Text(cat.countryCode ?? 'No se conoce su origen'),
          ),
        );
      },
    );
  }

  Widget _buildCatAvatar(dynamic cat) {
    final imageUrl = cat.image?.url;
    final name = cat.name ?? 'No se conoce su nombre';

    if (imageUrl != null) {
      return CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        onBackgroundImageError: (e, s) {
          debugPrint('Error al cargar la imagen: $e');
          //return CircleAvatar(child: Text(name[0]));
        },
      );
    }

    return CircleAvatar(child: Text(name[0]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catbreeds'),
        actions: [
          if (!_isLoading)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _loadCats,
            ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchField(),
          Expanded(
            child: Consumer<BreedProvider>(
              builder: (context, breedProvider, child) {
                if (_isLoading) {
                  return _buildLoadingWidget();
                }
                
                if (_error != null) {
                  return _buildErrorWidget(_error!);
                }
                
                return _buildCatList(breedProvider);
              },
            ),
          ),
        ],
      ),
    );
  }
}