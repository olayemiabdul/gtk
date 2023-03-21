import 'package:api_univaciti/Constant/api_constant.dart';
import 'package:api_univaciti/home/MovieDetails.dart';
import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  TrendingMovies(this.trending);
  var key;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF6F6FA),
      height: 1000.0,
      width: 5000.0,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TRENDING MOVIES',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 14.0,
                fontFamily: 'Poppins Black'),
          ),
          Container(
            height: 900.0,
            width: 4000.0,
            color: Colors.brown,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetails(
                            name: trending[index]['title'],
                            description: trending[index]['overview'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                trending[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                trending[index]['poster_path'],
                            vote: trending[index]['vote_average'].toString(),
                            launch_on: trending[index]['release_date'],
                            id: trending[index]['id'].toString(),
                            trailer: trending[index]['type'].toString(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 400,
                      height: 350,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path'],
                                  ),
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                              ),
                              //height: 2000,
                              // width: 4000,
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Positioned(
                            //to positioned the title at the bottom left
                            bottom: 250,
                            left: 20,
                            child: Text(
                              trending[index]['title'] != null
                                  ? (trending[index]['title'])
                                  : Text('loading').toString(),
                              textAlign: TextAlign.center,
                              style: kLabelStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
