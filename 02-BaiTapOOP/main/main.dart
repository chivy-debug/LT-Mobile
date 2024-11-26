import '../models/CuaHang.dart';
import '../models/DienThoai.dart';
import '../models/HoaDon.dart';

void main() {
  var cuaHang = CuaHang("Cửa Hàng Thế giới di động", "123 Đường Lê Văn Việt, Thành phố Thủ Đức");

  print("---Quản lý thông tin điện thoại---");
  try {

    var dt1 = Dienthoai("DT001", "IPhone 16 pro max", "Apple", 20000000, 25000000, 15, true);
    var dt2 = Dienthoai("DT002", "Samsung Galaxy S23", "Samsung", 15000000, 20000000, 10, true);
    cuaHang.themDienThoai(dt1);
    cuaHang.themDienThoai(dt2);

    cuaHang.capNhatDienThoai("DT001", giaBan: 26000000, tonKho: 20);

    cuaHang.hienThiDanhSachDienThoai();
  } catch (e) {
    print("Lỗi quản lý điện thoại: $e");
  }

  print("\n---Quản lý hóa đơn---");
  try {
    var hd1 = HoaDon("HD001", DateTime(2024, 11, 10), cuaHang.timKiemDienThoai(maDT: "DT001").first, 2, 25000000, "Duong Chi Vy", "0913013031");
    var hd2 = HoaDon("HD002", DateTime.now(), cuaHang.timKiemDienThoai(maDT: "DT002").first, 3, 20000000, "Ha Huy Chien Thang", "0847101103");
    cuaHang.taoHoaDon(hd1);
    cuaHang.taoHoaDon(hd2);

    cuaHang.hienThiDanhSachHoaDon();
  } catch (e) {
    print("Lỗi quản lý hóa đơn: $e");
  }

  //Thống kê báo cáo
  print("\n---Thống kê báo cáo---");
  try {
    DateTime from = DateTime(2024, 11, 10);
    DateTime to = DateTime.now();

    //Doanh thu theo khoảng thời gian
    double doanhThu = cuaHang.tinhTongDoanhThu(from, to);
    print("Tổng doanh thu từ $from đến $to: $doanhThu");

    //Lợi nhuận theo khoảng thời gian
    double loiNhuan = cuaHang.tinhTongLoiNhuan(from, to);
    print("Tổng lợi nhuận từ $from đến $to: $loiNhuan");

    //Top bán chạy
    var topBanChay = cuaHang.thongKeTopDienThoaiBanChay(1);
    print("Top điện thoại bán chạy:");
    for (var dt in topBanChay) {
      dt.hienThiThongTin();
    }
 
    //Báo cáo tồn kho
    var tonKho = cuaHang.thongKeTonKho();
    print("Báo cáo tồn kho:");
    tonKho.forEach((maDT, soLuong) {
      print("Mã điện thoại: $maDT, Tồn kho: $soLuong");
    });
  
  } catch (e) {
    print("Lỗi thống kê: $e");
  }
}
