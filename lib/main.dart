import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();
  final Future<List<MovieModel>> playingMovies = ApiService.getPlayingMovies();
  final Future<List<MovieModel>> comingSoonmovies =
      ApiService.getComingSoonMovies();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Popular Movies",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 180,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final movie = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        id: movie.id,
                                        title: movie.title,
                                      ),
                                    ));
                              },
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                  ],
                                ),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                          itemCount: snapshot.data!.length,
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Now in Cinemas",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: playingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 230,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final movie = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        id: movie.id,
                                        title: movie.title,
                                      ),
                                    ));
                              },
                              child: SizedBox(
                                width: 120,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            color:
                                                Colors.black.withOpacity(0.8),
                                          ),
                                        ],
                                      ),
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      movie.title,
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                          itemCount: snapshot.data!.length,
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Coming soon",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: comingSoonmovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 230,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final movie = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        id: movie.id,
                                        title: movie.title,
                                      ),
                                    ));
                              },
                              child: SizedBox(
                                width: 120,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            color:
                                                Colors.black.withOpacity(0.8),
                                          ),
                                        ],
                                      ),
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      movie.title,
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                          itemCount: snapshot.data!.length,
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Detail screen
class DetailScreen extends StatefulWidget {
  final int id;
  final String title;

  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieModel> movieDetail;

  @override
  void initState() {
    super.initState();
    movieDetail = ApiService.getMovieDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          "Back to list",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: movieDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final movie = snapshot.data!;
            int score = (movie.voteAverage / 2).round();
            String runningTime = movie.runtime == null
                ? "No info"
                : "${(movie.runtime! / 60).floor()}h ${(movie.runtime! % 60).round()}min";
            List<String> genres =
                movie.genres.map((genre) => genre["name"].toString()).toList();
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/original${movie.posterPath}",
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 250),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        for (var i = 0; i < 5; i++)
                          Icon(
                            Icons.star_rate_rounded,
                            color: i <= score ? Colors.yellow : Colors.grey,
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "$runningTime | ${genres.join(", ")}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "Stroyline",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        movie.overview,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 3,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: SizedBox(
                        width: 250,
                        height: 50,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => const Color(0xFFF9D949),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Buy ticket",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

// API service
class MovieModel {
  int id;
  int? runtime;
  String title, backdropPath, posterPath, overview;
  List<dynamic> genres;
  double voteAverage;

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        runtime = json["runtime"] ?? -1,
        title = json["title"],
        backdropPath = json["backdrop_path"],
        posterPath = json["poster_path"],
        overview = json["overview"],
        genres = List.from(json["genre_ids"] ?? json["genres"]),
        voteAverage = json["vote_average"].toDouble();
}

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> moviesInstances = [];
    final url = Uri.parse("$baseUrl/popular");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)["results"];
      for (var movie in movies) {
        moviesInstances.add(MovieModel.fromJson(movie));
      }
      return moviesInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getPlayingMovies() async {
    List<MovieModel> moviesInstances = [];
    final url = Uri.parse("$baseUrl/now-playing");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)["results"];
      for (var movie in movies) {
        moviesInstances.add(MovieModel.fromJson(movie));
      }
      return moviesInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingSoonMovies() async {
    List<MovieModel> moviesInstances = [];
    final url = Uri.parse("$baseUrl/coming-soon");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)["results"];
      for (var movie in movies) {
        moviesInstances.add(MovieModel.fromJson(movie));
      }
      return moviesInstances;
    }
    throw Error();
  }

  static Future<MovieModel> getMovieDetail(int id) async {
    final url = Uri.parse("$baseUrl/movie?id=$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> movie =
          json.decode(utf8.decode(response.bodyBytes));
      return MovieModel.fromJson(movie);
    }
    throw Error();
  }
}
