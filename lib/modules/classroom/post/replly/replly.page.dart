import 'package:flutter/material.dart';

import '../../../../model/class.model.dart';

class RepllyPage extends StatefulWidget {
  final ClassModel? classModel;
  const RepllyPage({super.key, this.classModel});

  @override
  State<RepllyPage> createState() => _RepllyPageState();
}

class _RepllyPageState extends State<RepllyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.classModel?.tenMon}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.account_circle,
                size: MediaQuery.of(context).size.width * 0.15,
              ),
              title: Text(
                "Hoàng Công thuận",
                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
              subtitle: Text(
                "29 thg 6, 2023,16:11",
                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Ngày hôm nay thánh ngài về đây, ăn xôi ăn gà phù hộ cho thí chủ đời đơời",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            ),
            const Divider(),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
