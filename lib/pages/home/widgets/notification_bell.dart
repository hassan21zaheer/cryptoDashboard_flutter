import 'package:crypto_dashboard_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class NotificationBell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
            ),
            Container(
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kDangerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
