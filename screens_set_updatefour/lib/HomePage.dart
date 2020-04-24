import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  Widget topRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
          radius: 20.0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.help_outline),
          ),
        ),
        SizedBox(width: 80.0),
        CircleAvatar(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
          radius: 20.0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.exit_to_app),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
          radius: 20.0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
          radius: 20.0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
        ),
      ],
    );
  }

  Widget bodyOptionsOne() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(18.0, 0.0, 4.0, 0.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/themeBgOne.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(140.0, 15.0, 10, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/wallet.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 60.0, 0.0, 0.0),
                child: Text(
                  'My Wallet',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(4.0, 0.0, 18.0, 0.0),
                // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/themeBgTwo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(130.0, 15.0, 10, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/cart.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                child: Text(
                  'MarketPlace',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bodyOptionsTwo() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(18.0, 12.0, 4.0, 0.0),
                // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/themeBgThree.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(140.0, 25.0, 10.0, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/health.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 70.0, 0.0, 0.0),
                child: Text(
                  'AiiHealth',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(4.0, 12.0, 18.0, 0.0),
                // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('images/themeBgFour.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(130.0, 25.0, 10.0, 0.0),
                child: Image(
                  width: 20.0,
                  image: AssetImage('images/net.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                child: Text(
                  'Device Network',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void boostImageLoading({BuildContext context}) {
    /// Trick for Fast loading of images  
    precacheImage(AssetImage('images/logo.png'), context);
    precacheImage(AssetImage('images/themeBgOne.png'), context);
    precacheImage(AssetImage('images/themeBgTwo.png'), context);
    precacheImage(AssetImage('images/themeBgThree.png'), context);
    precacheImage(AssetImage('images/themeBgFour.png'), context);
    precacheImage(AssetImage('images/wallet.png'), context);
    precacheImage(AssetImage('images/cart.png'), context);
    precacheImage(AssetImage('images/health.png'), context);
    precacheImage(AssetImage('images/net.png'), context);
  }

  @override
  Widget build(BuildContext context) {

    boostImageLoading(context: context);

    /// Turn off screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Asset',
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: topRow(),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(110.0, 30.0, 110.0, 10.0),
                  child: Image.asset('images/logo.png'),
                ),
                Text(
                  '#MyDataMyAsset',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 17.0,
                    color: Color.fromRGBO(45, 72, 92, 1.0),
                  ),
                ),
                SizedBox(height: 50.0),
                bodyOptionsOne(),
                bodyOptionsTwo(),
              ],
            ),
          ),
        ),
        floatingActionButton: InkWell(
            child: Text(
              'Privacy Policy | Terms & Conditions',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 13.0,
                color: Color.fromRGBO(45, 72, 92, 1.0),
              ),
            ),
            onTap:
                () {} //Add link inside as onTap:(){launch('your link to wake up t & c')}
            ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
