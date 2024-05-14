import 'package:animation_list/animation_list.dart';
import 'package:fe/app/widgets/will.pop.scope.dart';
import 'package:fe/modules/classroom/classroom.screen.dart';
import 'package:fe/modules/login/ui/login.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/constant/configLoading.dart';

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

  String? namHoc;

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
            "Danh sách học phần",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocProvider<ListLopHocCubit>(
          create: (context) => ListLopHocCubit()..getListLopHocState(),
          child: BlocBuilder<ListLopHocCubit, ListLopHocState>(
            builder: (contextState, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    if (state.isLoading == false) ...[
                      Center(
                        child: () {
                          EasyLoadingCustom.instance.dismiss();
                        }(),
                      ),
                      const Text("Chọn học kỳ"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isDismissible: true,
                              enableDrag: true,
                              context: context,
                              builder: (BuildContext contexts) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      AppBar(
                                        leading: IconButton(
                                          icon: const Icon(Icons.close),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        backgroundColor: Colors.transparent,
                                        title: const Text("Chọn năm học"),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.45,
                                        child: ListView.builder(
                                          itemCount: state.namHoc?.length,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  contextState.read<ListLopHocCubit>().getListLopHocState(nameHoc: state.namHoc![i].hoc_ky!);
                                                  setState(() {
                                                    namHoc = state.namHoc![i].ten_hoc_ky;
                                                  });

                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  "${state.namHoc?[i].ten_hoc_ky}",
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: FormField(
                            builder: (FormFieldState<dynamic> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text("${namHoc ?? state.namHoc?[0].ten_hoc_ky}"),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
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
                                          Container(
                                            child: () {
                                              EasyLoadingCustom.instance.dismiss();
                                            }(),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                "${item.tenMon} - ${item.nhomTo}",
                                                style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
                                                overflow: TextOverflow.clip,
                                              ))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Tên giảng viên: ${item.gv ?? ""}",
                                                    style: const TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w400),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {
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
                                                    child: Text("Vào lớp"),
                                                  )
                                                ],
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
                            ],
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                            )
                          ],
                        ),
                      )
                    ] else ...[
                      Container(
                        child: () {
                          EasyLoadingCustom.instance.loadingWithBackgroud("loading...");
                        }(),
                      )
                    ],
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
