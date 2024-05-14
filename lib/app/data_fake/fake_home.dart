import 'package:fe/model/replly.model.dart';

import '../../model/home.model.dart';

List<HomeModel> listHome = [
  HomeModel(
    id: "1",
    classId: "-8235883036325005461",
    createdBy: "2021050033",
    content: "Xin chào các bạn đến lớp học đồ án mạng máy tính do thầy phụ trách.",
    repply: [
      RepllyModel(id: "1", homeId: "1", createdBy: "NGuyễn a ", replly: "vâng"),
      RepllyModel(id: "2", homeId: "1", createdBy: "nguễn b", replly: "Em chào thầy"),
      RepllyModel(id: "3", homeId: "1", createdBy: "2021050033", replly: "Rất vui được đồng hành cùng các em trong học kỳ này."),
    ],
  ),
];
