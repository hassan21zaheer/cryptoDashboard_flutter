import 'package:flutter/material.dart';

class SingleCoinBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      width: double.infinity,
      color: Color.fromRGBO(55, 66, 92, 0.4),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your BTC balance",
                  style: TextStyle(
                      color: Colors.blueGrey
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "0.00692133 BTC",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "USD",
                style: TextStyle(
                  color: Colors.blueGrey
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "\$23.35",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
