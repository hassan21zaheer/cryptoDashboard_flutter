import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_simple_candlesticks/flutter_simple_candlesticks.dart';

class CoinChart extends StatefulWidget {
  @override
  _CoinChartState createState() => _CoinChartState();
}

class _CoinChartState extends State<CoinChart> {
  int activeIndex = 0;
  final List<CandleModel> sampleData = List.generate(
    25,
        (index) {
      double open = Random().nextDouble() * 100.0;
      double low = Random().nextDouble() * 50.0;
      double close = Random().nextDouble() * 150.0;
      double volume = Random().nextDouble() * 5000.0;
      return CandleModel(
        date: DateTime.now().add(Duration(days: index)),
        open: open,
        high: open * 2,
        low: low,
        close: close,
        volume: volume,
      );
    },
  ).toList();


  final List<String> chartTimes = ["Today", "1W", "1M", "3M", "6M", "1Y"];

  @override
  Widget build(BuildContext context) {
    const style = CandlestickChartStyle(
        yLegendStyle: CandlestickChartYLegendStyle(
            textStyle: TextStyle(color: Colors.white),
            numberOfLabels: 5,
            lineStyle: CandlestickChartLineStyle(width: 1, color: Colors.white)),
        candlestickStyle: CandlestickStyle(bullishColor: Color(0xFF38bbbf), bearishColor: Color(0xFFed7b9e)),
        candlestickSelectedStyle: CandlestickStyle(bullishColor: Color(0xff25787b), bearishColor: Color(0xff9d4963))
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: chartTimes.map((e) {
              int currentIndex = chartTimes.indexOf(e);
              return InkWell(
                onTap: () {
                  setState(() {
                    activeIndex = currentIndex;
                  });
                },
                child: Container(
                  color: currentIndex == activeIndex
                      ? Color.fromRGBO(55, 66, 92, 1)
                      : Colors.transparent,
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          height: 200.0,
          child: CandlesticksChart<CandleModel>(
    height: 200,
    data: sampleData,
    style: style,
    options: const CandlestickChartOptions(isScrollable: true),
            getHightCallback: (e) => e?.high ?? 0.0,
            getCloseCallback: (e) => e?.close ?? 0.0,
            getLowCallback: (e) => e?.low ?? 0.0,
            getOpenCallback: (e) => e?.open ?? 0.0,
            getTimeCallback: (e) => e?.date ?? DateTime.now(),
    ),
          // OHLCVGraph(
          //   data: sampleData,
          //   enableGridLines: true,
          //   volumeProp: (1 / sampleData.length),
          //   decreaseColor: kDangerColor,
          //   increaseColor: kSuccessColor,
          // ),
        ),
      ],
    );
  }
}

class CandleModel {
  final DateTime date;
  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;

  CandleModel({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });
}
