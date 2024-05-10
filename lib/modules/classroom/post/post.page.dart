import 'package:fe/modules/classroom/post/replly/replly.page.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../model/class.model.dart';

class PostPage extends StatefulWidget {
  final ClassModel? classModel;
  const PostPage({super.key, this.classModel});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController contenController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
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
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RepllyPage(
                              classModel: widget.classModel,
                            ),
                          ),
                        );
                      },
                      child: const Text("Trả lời"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: FloatingActionButton(
          backgroundColor: Colors.blue[700],
          foregroundColor: Colors.white,
          onPressed: () {
            Alert(
              title: "Tạo bài viết mới",
              context: context,
              content: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: TextFormField(
                      maxLines: 8,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              buttons: [
                DialogButton(
                  color: Colors.blue[700],
                  onPressed: () {},
                  child: const Text(
                    "Tạo bài viết mới",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ).show();
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 30,
              ),
              Text(
                "Tạo bài viết mới",
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
