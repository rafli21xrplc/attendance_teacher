import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 180,
      height: 180,
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Image.asset('assets/gif/loading.gif'),
          Text("Loading..."),
        ],
      ),
    );
  }
}

showLoading() {
  BotToast.showCustomLoading(toastBuilder: (close) {
    return LoadingWidget();
  });
}

stopLoading() {
  BotToast.closeAllLoading();
}
