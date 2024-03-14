import 'package:crypto_dashboard_flutter/pages/home/widgets/account_balance.dart';
import 'package:crypto_dashboard_flutter/pages/home/widgets/notification_bell.dart';
import 'package:crypto_dashboard_flutter/pages/home/widgets/other_coins.dart';
import 'package:crypto_dashboard_flutter/pages/home/widgets/user_balance.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kSuccessColor,
        hoverColor: Colors.tealAccent,
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: Drawer(
        backgroundColor: Colors.black38,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: DrawerHeader(
                child: Column(
                  children: [
                    Image(image: AssetImage('assets/images/bitcoin1.png'),height: 95,width: 100,fit: BoxFit.contain,),
                    // Icon(
                    //   Icons.dashboard,
                    //   size: 80,
                    //   color: Colors.white, // Set icon color to white
                    // ),
                    Text(
                      'Cryptex',
                      style: TextStyle(
                        color: kSuccessColor,
                        fontSize: 25,
                        letterSpacing: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet, color: Colors.white),
              title: Text('Wallet', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.show_chart, color: Colors.white),
              title: Text('Charts', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money, color: Colors.white),
              title: Text('Buy/Sell', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.white),
              title: Text('Notifications', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Add your navigation logic here
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Cryptex",
          style: TextStyle(color: Colors.white,
          letterSpacing: 2),
        ),
        actions: [
          NotificationBell(),
        ],
        
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25.0,
              ),
              AccountBalance(),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: Color.fromRGBO(97, 99, 119, 1),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              UserBalance(),
              OtherCoins(),
            ],
          ),
        ),
      ),
    );
  }
}
