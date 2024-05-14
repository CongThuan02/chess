import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/data_fake/fake_home.dart';

import '../../../../model/home.model.dart';
import '../../../../model/replly.model.dart';
import 'cubit/reply_cubit.dart';

class RepllyPage extends StatefulWidget {
  final String id;
  final HomeModel? home;
  const RepllyPage({super.key, this.home, required this.id});

  @override
  State<RepllyPage> createState() => _RepllyPageState();
}

class _RepllyPageState extends State<RepllyPage> {
  String? username;
  String? message;
  Future<void> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username");
    });
  }

  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${""}'),
      ),
      body: BlocProvider<ReplyCubit>(
        create: (context) => ReplyCubit()..getReply(id: widget.id),
        child: BlocBuilder<ReplyCubit, ReplyState>(
          builder: (contextReply, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.account_circle,
                          size: MediaQuery.of(context).size.width * 0.15,
                        ),
                        title: Text(
                          widget.home?.createdBy == username ? "Bạn" : "${widget.home?.createdBy}",
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
                          "${widget.home?.content}",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ),
                      const Divider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state.isLoading == false) ...[
                            if (state.reply != null) ...[
                              for (int i = 0; i < state.reply!.length; i++) ...{
                                ListTile(
                                  leading: Icon(
                                    Icons.account_circle,
                                    size: MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  title: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: widget.home?.repply?[i].createdBy == username ? "Bạn" : "${widget.home?.repply?[i].createdBy}",
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        const TextSpan(
                                          text: " 29 thg 6, 2023,16:11",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 28.0, right: 10),
                                  child: Text("${widget.home?.repply?[i].replly}"),
                                )
                              },
                            ]
                          ],
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.14,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: messageController,
                            onChanged: (String? value) {
                              if (value != null) {
                                setState(() {
                                  messageController.text = value;
                                });
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: "Write message...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            int id = 0;
                            for (int i = 0; i < listHome.length; i++) {
                              if (listHome[i].id == widget.id) {
                                setState(() {
                                  id = listHome[i].repply!.length + 1;
                                });
                              }
                            }
                            contextReply.read<ReplyCubit>().addReply(
                                  id: widget.id,
                                  repllyModel: RepllyModel(
                                    id: id.toString(),
                                    createdBy: username,
                                    replly: messageController.text,
                                  ),
                                );
                            contextReply.read<ReplyCubit>().getReply(id: widget.id);
                            messageController.text = "";
                          },
                          backgroundColor: Colors.blue,
                          elevation: 0,
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
