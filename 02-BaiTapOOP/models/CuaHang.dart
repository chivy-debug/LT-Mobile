import 'DienThoai.dart';
import 'HoaDon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<Dienthoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor với tên và địa chỉ
  CuaHang(this._tenCuaHang, this._diaChi);

  // Getters
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;

// Setters
  set tenCuaHang(String tenCuaHang) {
    if (tenCuaHang.isNotEmpty) {
      _tenCuaHang = tenCuaHang;
    } 
  }

  set diaChi(String diaChi) {
    if (diaChi.isNotEmpty) {
      _diaChi = diaChi;
    } 
  }

  // Phương thức quản lý điện thoại
  void themDienThoai(Dienthoai dt) {
    _danhSachDienThoai.add(dt);
    print("Đã thêm điện thoại: ${dt.tenDT}");
  }

  void capNhatDienThoai(String maDT,
      {String? tenDT,
      String? hangSX,
      double? giaNhap,
      double? giaBan,
      int? tonKho,
      bool? trangThai}) {
    var dt = _danhSachDienThoai.firstWhere((d) => d.maDT == maDT,
        orElse: () =>
            throw ArgumentError("Không tìm thấy điện thoại với mã: $maDT"));
    if (tenDT != null) dt.tenDT = tenDT;
    if (hangSX != null) dt.hangSX = hangSX;
    if (giaNhap != null) dt.giaNhap = giaNhap;
    if (giaBan != null) dt.giaBan = giaBan;
    if (tonKho != null) dt.tonKho = tonKho;
    if (trangThai != null) dt.trangThai = trangThai;
    print("Thông tin điện thoại đã được cập nhật.");
  }

  void ngungKinhDoanhDienThoai(String maDT) {
    var dt = _danhSachDienThoai.firstWhere((d) => d.maDT == maDT,
        orElse: () =>
            throw ArgumentError("Không tìm thấy điện thoại với mã: $maDT"));
    dt.trangThai = false;
    print("Điện thoại với mã $maDT đã ngừng kinh doanh.");
  }

  List<Dienthoai> timKiemDienThoai(
      {String? maDT, String? tenDT, String? hangSX}) {
    return _danhSachDienThoai.where((dt) {
      return (maDT == null || dt.maDT.contains(maDT)) &&
          (tenDT == null || dt.tenDT.contains(tenDT)) &&
          (hangSX == null || dt.hangSX.contains(hangSX));
    }).toList();
  }

  void hienThiDanhSachDienThoai() {
    print("Danh sách điện thoại:");
    for (var dt in _danhSachDienThoai) {
      dt.hienThiThongTin();
      print("----------");
    }
  }

  // Phương thức quản lý hóa đơn
  void taoHoaDon(HoaDon hd) {
    var dt = _danhSachDienThoai.firstWhere((d) => d.maDT == hd.dienThoai.maDT,
        orElse: () => throw ArgumentError("Điện thoại không tồn tại."));
    if (hd.soLuongMua > dt.tonKho) {
      throw ArgumentError("Số lượng tồn kho không đủ để tạo hóa đơn.");
    }
    dt.tonKho -= hd.soLuongMua;
    _danhSachHoaDon.add(hd);
    print("Hóa đơn đã được tạo thành công.");
  }

  List<HoaDon> timKiemHoaDon(
      {String? maHD, DateTime? ngay, String? tenKhachHang}) {
    return _danhSachHoaDon.where((hd) {
      return (maHD == null || hd.maHD.contains(maHD)) &&
          (ngay == null || hd.ngayBan.isAtSameMomentAs(ngay)) &&
          (tenKhachHang == null || hd.tenKhachHang.contains(tenKhachHang));
    }).toList();
  }

  void hienThiDanhSachHoaDon() {
    print("Danh sách hóa đơn:");
    for (var hd in _danhSachHoaDon) {
      hd.hienThiThongTin();
      print("----------");
    }
  }

  // Phương thức thống kê
  double tinhTongDoanhThu(DateTime from, DateTime to) {
    return _danhSachHoaDon
        .where((hd) => hd.ngayBan.isAfter(from) && hd.ngayBan.isBefore(to))
        .fold(0, (sum, hd) => sum + hd.tinhTongTien());
  }

  double tinhTongLoiNhuan(DateTime from, DateTime to) {
    return _danhSachHoaDon
        .where((hd) => hd.ngayBan.isAfter(from) && hd.ngayBan.isBefore(to))
        .fold(0, (sum, hd) => sum + hd.tinhLoiNhuanThucTe());
  }

  List<Dienthoai> thongKeTopDienThoaiBanChay(int top) {
    var banChay = Map<String, int>();
    for (var hd in _danhSachHoaDon) {
      var maDT = hd.dienThoai.maDT;
      banChay[maDT] = (banChay[maDT] ?? 0) + hd.soLuongMua;
    }
    var sorted = banChay.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sorted
        .take(top)
        .map((e) => _danhSachDienThoai.firstWhere((dt) => dt.maDT == e.key))
        .toList();
  }

  Map<String, int> thongKeTonKho() {
    return {for (var dt in _danhSachDienThoai) dt.maDT: dt.tonKho};
  }
}
