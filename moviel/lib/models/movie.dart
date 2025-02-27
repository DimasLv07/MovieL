class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final String voterAverage;
 

  Movie({required this.title, required this.overview, required this.posterPath, required this.backdropPath, required this.releaseDate, required this.voterAverage, required this.id});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      voterAverage: json['vote_average'].toDouble(),
      
    );
  }
}