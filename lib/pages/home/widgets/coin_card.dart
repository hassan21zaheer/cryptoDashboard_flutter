import 'package:crypto_dashboard_flutter/models/coin.dart';
import 'package:crypto_dashboard_flutter/pages/coin_detail/coin_detail.dart';
import 'package:crypto_dashboard_flutter/utils/constants.dart'; // Make sure Trend and related constants are imported
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CoinCard extends StatelessWidget {
  final Coin coin;
  CoinCard({required this.coin});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return CoinDetail(coin: this.coin);
              },
            ),
          );
        },
        child: Container(
          height: 90.0, // Ensure the height is properly defined
          color: Color.fromRGBO(55, 66, 92, 0.4),
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            children: [
              Container(
                width: 40.0, // Ensure the width is properly defined
                child: Image.asset(
                  coin.getImagePath(),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${coin.toString()} (${coin.getCoinAbbr()})",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "${coin.balance}",
                    style: themeData.textTheme.caption,
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${coin.currentPrice}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        getCoinProgress(coin),
                        style: TextStyle(
                          color: coin.trend == Trend.UP
                              ? kSuccessColor
                              : kDangerColor,
                          fontSize: 13.0,
                        ),
                      ),
                      Icon(
                        coin.trend == Trend.UP
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        size: 14.0,
                        color: coin.trend == Trend.UP
                            ? kSuccessColor
                            : kDangerColor,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          color: kDangerColor,
          icon: Icons.clear,
          foregroundColor: Colors.white,
          onTap: () => null,
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          color: kSuccessColor,
          icon: Icons.add,
          foregroundColor: Colors.white,
          onTap: () => null,
        ),
      ],
    );
  }
}

String getCoinProgress(Coin coin) {
  String returnValue = "";

  if (coin.trend == Trend.UP) {
    returnValue += "+";
  } else {
    returnValue += "-";
  }

  returnValue += "\$${coin.amountProgress} (${coin.percentProgress}%)";

  return returnValue;
}
