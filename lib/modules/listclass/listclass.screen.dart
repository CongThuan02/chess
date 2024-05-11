import 'package:animation_list/animation_list.dart';
import 'package:fe/app/widgets/will.pop.scope.dart';
import 'package:fe/modules/classroom/classroom.screen.dart';
import 'package:fe/modules/login/ui/login.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit/list_lop_hoc_cubit.dart';

enum SortOption { tenMon, phong }

class ListClassScreen extends StatefulWidget {
  final bool isTeacher;
  const ListClassScreen({super.key, required this.isTeacher});
  @override
  State<ListClassScreen> createState() => _ListClassScreenState();
}

class _ListClassScreenState extends State<ListClassScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPS(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const LoginScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.logout,
              size: 30,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Dánh sách môn học",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocProvider(
          create: (context) => ListLopHocCubit()..getListLopHocState(),
          child: BlocBuilder<ListLopHocCubit, ListLopHocState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    state.isLoading == false
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                if (state.listClass != null) ...[
                                  Expanded(
                                    child: AnimationList(
                                        children: state.listClass!.map((item) {
                                      return Container(
                                        width: MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.only(bottom: 15),
                                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1, color: Colors.grey),
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(255, 79, 79, 79).withOpacity(0.5),
                                              blurRadius: 8,
                                              offset: const Offset(3, 3),
                                            ),
                                          ],
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            SharedPreferences prefs = await SharedPreferences.getInstance();
                                            String? idUser = prefs.getString("id");
                                            Navigator.push<void>(
                                              context,
                                              MaterialPageRoute<void>(
                                                builder: (BuildContext context) => ClassRoomScreen(
                                                  classModel: item,
                                                  idUser: idUser ?? "",
                                                  isTeacher: widget.isTeacher,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    "${item.tenMon ?? ""}",
                                                    style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
                                                    overflow: TextOverflow.clip,
                                                  ))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    "Tên giảng viên: ${item.gv ?? ""}",
                                                    style: const TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w400),
                                                    overflow: TextOverflow.ellipsis,
                                                  ))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    "Phòng học: ${item.phong ?? ""}",
                                                    style: const TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400),
                                                    overflow: TextOverflow.ellipsis,
                                                  ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList()),
                                  ),
                                ]
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
