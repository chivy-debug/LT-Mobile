import 'DienThoai.dart';


class HoaDon {
  String _maHD;
  DateTime _ngayBan;
  Dienthoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor 
  HoaDon(this._maHD, this._ngayBan, this._dienThoai, this._soLuongMua, this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach);

  // Getters
  String get maHD => _maHD;
  DateTime get ngayBan => _ngayBan;
  Dienthoai get dienThoai => _dienThoai;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get soDienThoaiKhach => _soDienThoaiKhach;

  // Setters
  set maHD(String maHD) {
    if (maHD.isNotEmpty && RegExp(r"^HD-\d{3}$").hasMatch(maHD)) {
      _maHD = maHD;
    } 
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isBefore(DateTime.now()) || ngayBan.isAtSameMomentAs(DateTime.now())) {
      _ngayBan = ngayBan;
    } 
  }

  set soLuongMua(int soLuongMua) {
    if (soLuongMua > 0 && soLuongMua <= _dienThoai.tonKho) {
      _soLuongMua = soLuongMua;
    }
  }

  set giaBanThucTe(double giaBanThucTe) {
    if (giaBanThucTe > 0) {
      _giaBanThucTe = giaBanThucTe;
    } 
  }

  set tenKhachHang(String tenKhachHang) {
    if (tenKhachHang.isNotEmpty) {
      _tenKhachHang = tenKhachHang;
    } 
  }

  set soDienThoaiKhach(String soDienThoaiKhach) {
    if (RegExp(r"^\d{10}$").hasMatch(soDienThoaiKhach)) {
      _soDienThoaiKhach = soDienThoaiKhach;
    } 
  }

  double tinhTongTien() {
    return _giaBanThucTe * _soLuongMua;
  }

  double tinhLoiNhuanThucTe() {
    return (_giaBanThucTe - _dienThoai.giaNhap) * _soLuongMua;
  }

  void hienThiThongTin() {
    print("Mã hóa đơn: $_maHD");
    print("Ngày bán: ${_ngayBan.toLocal()}");
    print("Tên điện thoại: ${_dienThoai.tenDT}");
    print("Số lượng mua: $_soLuongMua");
    print("Giá bán thực tế: $_giaBanThucTe");
    print("Tên khách hàng: $_tenKhachHang");
    print("Số điện thoại khách: $_soDienThoaiKhach");
    print("Tổng tiền: ${tinhTongTien()}");
    print("Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}");
  }
}

