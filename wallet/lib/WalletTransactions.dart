import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WalletTransactions extends StatefulWidget {
  @override
  _WalletTransactionsState createState() => _WalletTransactionsState();
}

class _WalletTransactionsState extends State<WalletTransactions> {
  List<Container> transactionHistory = <Container>[];

  bool userTransaction;
  String type;
  String amount;
  String date;
  bool reset;

  void buildHistory(
      {bool userTransaction,
      String type,
      String amount,
      String date,
      bool reset: false}) {
    if (reset) {
      transactionHistory = <Container>[];
    } else {
      (userTransaction)
          ? transactionHistory
              .add(historyRow(type: type, amount: amount, date: date))
          : null;
    }
  }

  Widget historyRow({String type, String amount, String date}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$type',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(45, 75, 92, 1.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '$amount',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(45, 75, 92, 1.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '$date',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(45, 75, 92, 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Turn off screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              /// I am created for testing button delete my this chunk of code
              RaisedButton(
                onPressed: () {
                  setState(() {
                    buildHistory(
                        userTransaction: true,
                        type: 'Send  ',
                        amount: '400',
                        date: '11 April',
                        reset: false);
                  });
                },
                child: Text('Send'),
              ),

              RaisedButton(
                onPressed: () {
                  setState(() {
                    buildHistory(
                        userTransaction: true,
                        type: 'Credit',
                        amount: '500',
                        date: '12 April',
                        reset: false);
                  });
                },
                child: Text('Credit'),
              ),

              // Delete above
              Container(
                margin: EdgeInsets.fromLTRB(120.0, 40.0, 120.0, 10.0),
                child: Image.asset('images/logo.png'),
              ),
              Text(
                '#MyDataMyAsset',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(45, 75, 92, 1.0),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 50.0),
                // color: Color.fromRGBO(255, 255, 255, 1.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Wallet',
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                                color: Color.fromRGBO(45, 75, 92, 1.0),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Transactions',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(45, 75, 92, 1.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                height: 50.0,
                                child: RaisedButton(
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: () {},
                                  color: Color.fromRGBO(99, 203, 218, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    'Send',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontSize: 14.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: SizedBox(
                                height: 50.0,
                                child: RaisedButton(
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: () {},
                                  color: Color.fromRGBO(99, 203, 218, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    'Receive',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontSize: 14.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40.0, bottom: 10.0, left: 5.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Transaction History',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w900,
                                color: Color.fromRGBO(45, 75, 92, 1.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0),
                          child: Divider(
                            thickness: 1.0,
                            color: Color.fromRGBO(112, 112, 112, 1.0),
                          ),
                        ),
                        Column(
                          children: transactionHistory,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
