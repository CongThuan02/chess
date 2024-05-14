class NamHoc {
  final String? ten_hoc_ky;
  final int? hoc_ky;
  final int? hiendiensv;
  final String? ngay_bat_dau_hk;
  final String? ngay_ket_thuc_hk;

  NamHoc copyWith({
    final String? ten_hoc_ky,
    final int? hoc_ky,
    final int? hiendiensv,
    final String? ngay_bat_dau_hk,
    final String? ngay_ket_thuc_hk,
  }) {
    return NamHoc(
      ten_hoc_ky: ten_hoc_ky ?? this.ten_hoc_ky,
      hoc_ky: hoc_ky ?? this.hoc_ky,
      hiendiensv: hiendiensv ?? this.hiendiensv,
      ngay_bat_dau_hk: ngay_bat_dau_hk ?? this.ngay_bat_dau_hk,
      ngay_ket_thuc_hk: ngay_ket_thuc_hk ?? this.ngay_ket_thuc_hk,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ten_hoc_ky': ten_hoc_ky,
      'hoc_ky': hoc_ky,
      'hiendiensv': hiendiensv,
      'ngay_bat_dau_hk': ngay_bat_dau_hk,
      'ngay_ket_thuc_hk': ngay_ket_thuc_hk,
    };
  }

  factory NamHoc.fromMap(dynamic map) {
    var temp;
    return NamHoc(
      ten_hoc_ky: map['ten_hoc_ky']?.toString(),
      hoc_ky: null == (temp = map['hoc_ky']) ? null : (temp is num ? temp.toInt() : int.tryParse(temp)),
      hiendiensv: null == (temp = map['hiendiensv']) ? null : (temp is num ? temp.toInt() : int.tryParse(temp)),
      ngay_bat_dau_hk: map['ngay_bat_dau_hk']?.toString(),
      ngay_ket_thuc_hk: map['ngay_ket_thuc_hk']?.toString(),
    );
  }
  NamHoc({
    this.ten_hoc_ky,
    this.hoc_ky,
    this.hiendiensv,
    this.ngay_bat_dau_hk,
    this.ngay_ket_thuc_hk,
  });
}
