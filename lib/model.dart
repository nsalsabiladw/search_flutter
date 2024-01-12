class PostModel {
  int? id;
  String? nama;
  String? nim;
  String? prodi;
  String? alamat;

  //buat contructor
  PostModel({
    required this.id,
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.alamat
  });

  //buat contructor custom
  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    nim = json['nim'];
    prodi = json['prodi'];
    alamat = json['alamat'];
  }
}