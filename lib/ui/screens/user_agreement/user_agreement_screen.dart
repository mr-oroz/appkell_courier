import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class UserAgreementScreen extends StatelessWidget {
  const UserAgreementScreen(
      {Key? key, required this.pdfFile, required this.appBarText})
      : super(key: key);

  final String pdfFile;
  final String appBarText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(appBarText,
            style: const TextStyle(
              fontSize: 16,
            )),
        elevation: 0,
      ),
      body: PDF(
        pageFling: false,
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        // onPageChanged: ( page, total) {
        //   print('page change: $page/$total');
        // },
      ).fromAsset(pdfFile),
    );
  }
}
