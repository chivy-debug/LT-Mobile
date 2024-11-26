class Dienthoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _tonKho;
  bool _trangThai;

  // Constructor đầy đủ tham số
  Dienthoai(this._maDT, this._tenDT, this._hangSX, this._giaNhap, this._giaBan, this._tonKho, this._trangThai);

  // Getters
  String get maDT => _maDT;
  String get tenDT => _tenDT;
  String get hangSX => _hangSX;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get tonKho => _tonKho;
  bool get trangThai => _trangThai;

  // Setters
  set maDT(String maDT) {
    if (maDT.isNotEmpty && RegExp(r"^DT-\d{3}$").hasMatch(maDT)) {
      _maDT = maDT;
    } 
  }

  set tenDT(String tenDT) {
    if (tenDT.isNotEmpty) {
      _tenDT = tenDT;
    } 
  }

  set hangSX(String hangSX) {
    if (hangSX.isNotEmpty) {
      _hangSX = hangSX;
    } 
  }

  set giaNhap(double giaNhap) {
    if (giaNhap > 0) {
      _giaNhap = giaNhap;
    } 
  }

  set giaBan(double giaBan) {
    if (giaBan > 0 && giaBan > _giaNhap) {
      _giaBan = giaBan;
    } 
  }

  set tonKho(int tonKho) {
    if (tonKho >= 0) {
      _tonKho = tonKho;
    } 
  }

  set trangThai(bool trangThai) {
    _trangThai = trangThai;
  }

  double tinhLoiNhuan() {
    return (_giaBan - _giaNhap) * _tonKho;
  }

  void hienThiThongTin() {
    print("Mã điện thoại: $_maDT");
    print("Tên điện thoại: $_tenDT");
    print("Hãng sản xuất: $_hangSX");
    print("Giá nhập: $_giaNhap");
    print("Giá bán: $_giaBan");
    print("Số lượng tồn kho: $_tonKho");
    print("Trạng thái: ${_trangThai ? "Đang kinh doanh" : "Ngừng kinh doanh"}");
  }


  bool coTheBan() {
    return _tonKho > 0 && _trangThai;
  }
}
