import 'package:api_univaciti/Constant/api_constant.dart';
import 'package:api_univaciti/home/trending.dart';
import 'package:api_univaciti/home/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class abdulPage extends StatefulWidget {
  const abdulPage({Key? key}) : super(key: key);

  @override
  State<abdulPage> createState() => _abdulPageState();
}

class _abdulPageState extends State<abdulPage> {
  List currentMovies = [];
  List currentSeries = [];
  List currentTv = [];
  List upComingMovies = [];
  @override
  void initState() {
    super.initState();
    getMovies();
  }

  getMovies() async {
    TMDB abdulTmdb = TMDB(ApiKeys(apiKey, apiReadAcccessToken),
        logConfig: const ConfigLogger(
          showUrlLogs: true,
          showErrorLogs: true,
        ));
    Map currentResult = await abdulTmdb.v3.trending.getTrending();
    Map seriesResult = await abdulTmdb.v3.movies.getTopRated();
    Map tvResult = await abdulTmdb.v3.tv.getPopular();
    Map upcomingResult = await abdulTmdb.v3.movies.getUpcoming();

    setState(() {
      currentMovies = currentResult['results']; // get trending movies
      currentSeries = seriesResult['results']; // get toprated movies
      currentTv = tvResult['results']; // get trending tv series
      upComingMovies = upcomingResult['results']; // get upcoming movies
    });
    //print upcoming movies to the console
    print(currentResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Tentwenty:App Test',
          style: kLabelStyle,
        ),
        leading: Column(
          children: [
            const SizedBox(
              height: 22.0,
            ),
            const Text(
              'Watch',
            ),
          ],
        ),
        actions: [
          Row(
            children: const [
              Icon(
                Icons.search,
                size: 20.0,
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal[400],
        shape: const CircularNotchedRectangle(),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF2E2739),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(1.0),
              bottomRight: Radius.circular(1.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Positioned(
                    child: IconButton(
                      icon: const Icon(Icons.dashboard),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  const Text(
                    'Dashboard',
                    style: kbottomStyle,
                  ),
                ],
              ),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.play_circle_fill_sharp,
                      color: Colors.white,
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  const Text(
                    'Watch',
                    style: kbottomStyle,
                  ),
                ],
              ),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.folder),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  const Text(
                    'Media Library',
                    style: kbottomStyle,
                  ),
                ],
              ),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  const Text(
                    'More',
                    style: kbottomStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          TrendingMovies(currentMovies),
          SizedBox(
            height: 12.0,
          ),
          UpcomingMovies(upComingMovies),
        ],
      ),
    );
  }
}
