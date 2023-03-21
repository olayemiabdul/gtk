import 'package:api_univaciti/Constant/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetails extends StatelessWidget {
  final String name,
      description,
      bannerurl,
      posterurl,
      vote,
      id,
      trailer,
      launch_on;

  MovieDetails({
    super.key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
    required this.id,
    required this.trailer,
  });

  launchURLApp() async {
    var url = Uri.parse(
        "https://www.themoviedb.org/video/channel/UCpJN7kiUkDrH11p0GQhLyFw");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          size: 12.0,
        ),
        title: Text(
          'Watch',
          style: kLabelStyle,
        ),
      ),
      backgroundColor: Color(0xFF0A0908),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250.0,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250.0,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Positioned(
                      bottom: 10,
                      left: 10.0,
                      child: Container(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          name != null ? name : 'Not Named',
                          style: kLabelStyle,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12.0,
                    child: Text(
                      '⭐ Rating-' + vote,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'In Theaters -' + launch_on,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: 20,
                width: 200,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.lightBlue),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Get Tickets',
                    style: kLabelStyle,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: 20,
                width: 300,
                child: Row(
                  children: [
                    Icon(
                      Icons.play_circle,
                      color: Colors.lightBlue,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.lightBlue),
                      ),
                      onPressed: () {
                        //https://youtu.be/SUXWAEX2jlg
                        // html.window.open('https://www.themoviedb.org/video/channel/UCpJN7kiUkDrH11p0GQhLyFw',"_self");
                        launchURLApp();
                      },
                      child: Text(
                        trailer,
                        style: kLabelStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Overview',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Text(
                    description,
                    style: kLabelStyle,
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
