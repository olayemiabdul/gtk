import 'package:api_univaciti/Constant/api_constant.dart';
import 'package:api_univaciti/home/MovieDetails.dart';
import 'package:flutter/material.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcoming;
  UpcomingMovies(this.upcoming);
  var key;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF6F6FA),
      height: 900.0,
      width: 4000.0,
      padding: EdgeInsets.all(16),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UPCOMING MOVIES',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 14.0,
                  fontFamily: 'Poppins Black'),
            ),
            Container(
              height: 400.0,
              width: 2000.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcoming.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetails(
                              name: upcoming[index]['title'],
                              description: upcoming[index]['overview'],
                              bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                  upcoming[index]['backdrop_path'],
                              posterurl: 'https://image.tmdb.org/t/p/w500' +
                                  upcoming[index]['poster_path'],
                              vote: upcoming[index]['vote_average'].toString(),
                              launch_on: upcoming[index]['release_date'],
                              id: upcoming[index]['id'].toString(),
                              trailer: upcoming[index]['type'].toString(),
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
                                          upcoming[index]['poster_path'],
                                    ),
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                  ),
                                ),
                                //height: 500,
                                //width: 500,
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
                                upcoming[index]['title'] != null
                                    ? (upcoming[index]['title'])
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
      ),
    );
  }
}
