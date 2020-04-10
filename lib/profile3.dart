import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profiepage3/profile.dart';
import 'provider.dart';

class Profile3 extends StatefulWidget {
  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  Profile _profile = ProfileProvider.getProfile();
  @override
  Widget build(BuildContext context) {
//    return Theme(
//        data: ThemeData(fontFamily: 'Baloo'),
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/profiles/landscape_1.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              )
            ],
          ),
          body: Stack(
            children: <Widget>[
              _bodyContant(context),
              _profileImage(context),
            ],
          ),
        )
      ],
    );
  }

  Widget _bodyContant(BuildContext context) {
    Color _textColor = Color(0xff4e4e4e);
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.07,
      left: 16,
      right: 16,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(top: 55),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: ListView(
//          padding: EdgeInsets.all(24),
          children: <Widget>[
            Text(
              _profile.user.name,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28,
                color: _textColor,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 14, bottom: 20),
              child: Text(
                _profile.user.address,
                style: TextStyle(
                  color: _textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: _followButton(context),
            ),
            _divider(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: _counters(context),
            ),
            _divider(context),
            Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'PHOTOS (${_profile.photos.toString()})',
                style:
                    TextStyle(color: _textColor, fontWeight: FontWeight.bold),
              ),
            ),
            _photos(context),
            ..._aboutMe(context),
            _frinends(context),
            _contacts(context),
          ],
        ),
      ),
    );
  }

  Widget _profileImage(BuildContext context) {
    return Positioned(
      //=>35 nsf elkor(r of circule) bta3 elsorh
      top: MediaQuery.of(context).size.height * 0.07 - 35,
      left: MediaQuery.of(context).size.width / 2 - 35,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/shard/1.jpg'),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle),
      ),
    );
  }

  Widget _followButton(BuildContext context) {
    Color _buttonColor = Color(0xfff05522);
    return Align(
      child: MaterialButton(
        color: _buttonColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'FOLLOW',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade300,
    );
  }

  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade600,
  );
  TextStyle _bottomBarsubTitle =
      TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700);

  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'FOLLWERS',
                style: _bottomBarTitle,
              ),
              Text(
                _profile.followers.toString(),
                style: _bottomBarsubTitle,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'FOLLWING',
                style: _bottomBarTitle,
              ),
              Text(
                _profile.following.toString(),
                style: _bottomBarsubTitle,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'FRIENDS',
                style: _bottomBarTitle,
              ),
              Text(
                _profile.friends.toString(),
                style: _bottomBarsubTitle,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _photos(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 16),
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            imgph(url: 'assets/shard/girl2.jpeg',),
            imgph(url: 'assets/shard/man4.png',),
            imgph(url: 'assets/shard/man5.png',),
            imgph(url: 'assets/shard/1.jpg',),
            imgph(url: 'assets/shard/girl2.jpeg',),
            imgph(url: 'assets/shard/man4.png',),

          ],
        )
    );
//===========================================================
 // list veiw horizontal but show  same img
//    return Container(
//      width: double.infinity,
//      padding: EdgeInsets.only(left: 24),
//      height: 100,
//      child:
//      ListView(
//        children: List.generate(_profile.photos, (index) {
//          return Container(
//            width: 100,
//            height: 100,
//            margin: EdgeInsets.only(right: 16),
//            decoration: BoxDecoration(
//                image: DecorationImage(
//                    image: ExactAssetImage('assets/shard/man4.png'),
//                    fit: BoxFit.cover),
//                borderRadius: BorderRadius.all(Radius.circular(15))),
//          );
//        }).toList(),
//        scrollDirection: Axis.horizontal,
//      ),
//    );
  }

  List<Widget> _aboutMe(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Text(
          'ABOUT ME',
          style: TextStyle(
              color: Color(0xff4e4e4e),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          _profile.user.about,
          style: TextStyle(
            color: Color(0xff4e4e4e),
            fontSize: 16,
            height: 1.5,
            letterSpacing: 1.1,
          ),
        ),
      ),
    ];
  }

  Widget _frinends(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(
        "FRIENDS (${_profile.friends.toString()})",
        style: TextStyle(
            color: Color(0xff4e4e4e),
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _contacts(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 16),
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            img(url: 'assets/shard/girl2.jpeg',),
            img(url: 'assets/shard/man4.png',),
            img(url: 'assets/shard/1.jpg',),
            img(url: 'assets/shard/man5.png',),
            img(url: 'assets/shard/girl2.jpeg',),
            img(url: 'assets/shard/man4.png',),
            img(url: 'assets/shard/1.jpg',),
            img(url: 'assets/shard/man5.png',),
          ],
//=====================================================================================
//make loop for one page without put diffrent pic
//            children: List.generate(10, (index) {
//              return Container(
//                margin: EdgeInsets.only(right: 10, bottom: 2),
//                width: 50,
//                decoration: BoxDecoration(
//                    image: DecorationImage(
//                        image: ExactAssetImage('assets/shard/girl2.jpeg'),
//                        fit: BoxFit.cover),
//                    shape: BoxShape.circle),
//              );
//            }).toList()
        ));
  }
}

class img extends StatelessWidget {
  String url;
  img({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 2),
      width: 50,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: ExactAssetImage(url), fit: BoxFit.cover),
          shape: BoxShape.circle),
    );
  }
}


class imgph extends StatelessWidget {
  String url;
  imgph({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 2),
      width: 100,
      decoration: BoxDecoration(
          image:
          DecorationImage(image: ExactAssetImage(url), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );
  }
}
