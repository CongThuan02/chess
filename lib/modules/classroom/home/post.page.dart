import 'package:fe/model/home.model.dart';
import 'package:fe/modules/classroom/home/replly/replly.page.dart';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../app/data_fake/fake_home.dart';
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
  List<HomeModel> homeModel = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < listHome.length; i++) {
      if (widget.classModel?.id == listHome[i].classId) {
        setState(() {
          homeModel.add(listHome[i]);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: homeModel.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Column(
                  children: [
                    for (int i = 0; i < homeModel.length; i++) ...{
                      ListTile(
                        leading: Icon(
                          Icons.account_circle,
                          size: MediaQuery.of(context).size.width * 0.15,
                        ),
                        title: Text(
                          "${homeModel[i].createdBy}",
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
                          "${homeModel[i].content}",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "reply: ${homeModel[i].repply?.length ?? 0}",
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
                                home: homeModel[i],
                                id: '${listHome[i].id}',
                              ),
                            ),
                          );
                        },
                        child: const Text("Trả lời"),
                      ),
                    },
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.09,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 25,
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
