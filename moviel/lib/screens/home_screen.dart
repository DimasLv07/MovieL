import 'package:flutter/material.dart';
import 'package:moviel/models/movie.dart';
import 'package:moviel/service/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<Movie> _trendingMovies = [];
  List<Movie> _popularMovies = [];

  Future<void> _getTrendingMovies() async {
    final movies = await _apiService.getTrendingMovies();
    setState(() {
      _trendingMovies = movies.map((e) => Movie.fromJson(e)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _getTrendingMovies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moviel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Trending Movies',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                
                itemBuilder: (context, int index) {
                  final Movie movie = _trendingMovies[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
          
                         Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        
                        const SizedBox(height: 5),
                        Text(
                          movie.title.length > 14 ? '${movie.title.substring(0, 18)}...' : movie.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}