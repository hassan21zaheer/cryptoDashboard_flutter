import 'package:crypto_dashboard_flutter/pages/home/widgets/coin_card.dart';
import 'package:crypto_dashboard_flutter/utils/static_data.dart';
import 'package:flutter/material.dart';

class OtherCoins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Other Coins",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: StaticData.otherCoins.length,
            itemBuilder: (BuildContext context, int index) {
              return CoinCard(
                coin: StaticData.otherCoins[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 15.0,
              );
            },
          )
        ],
      ),
    );
  }
}
