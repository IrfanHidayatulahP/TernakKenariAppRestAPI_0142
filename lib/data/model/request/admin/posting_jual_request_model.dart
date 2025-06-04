import 'dart:convert';

class PostingJualRequestModel {
    final String? message;
    final int? statusCode;
    final Data? data;

    PostingJualRequestModel({
        this.message,
        this.statusCode,
        this.data,
    });

    factory PostingJualRequestModel.fromJson(String str) => PostingJualRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PostingJualRequestModel.fromMap(Map<String, dynamic> json) => PostingJualRequestModel(
        message: json["message"],
        statusCode: json["status_code"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "status_code": statusCode,
        "data": data?.toMap(),
    };
}

class Data {
    final int? id;
    final String? noRing;
    final DateTime? tanggalLahir;
    final String? jenisKelamin;
    final String? jenisKenari;
    final dynamic gambarAnak;
    final String? ayahNoRing;
    final String? ibuNoRing;

    Data({
        this.id,
        this.noRing,
        this.tanggalLahir,
        this.jenisKelamin,
        this.jenisKenari,
        this.gambarAnak,
        this.ayahNoRing,
        this.ibuNoRing,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        noRing: json["no_ring"],
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        jenisKenari: json["jenis_kenari"],
        gambarAnak: json["gambar_anak"],
        ayahNoRing: json["ayah_no_ring"],
        ibuNoRing: json["ibu_no_ring"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "no_ring": noRing,
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "jenis_kenari": jenisKenari,
        "gambar_anak": gambarAnak,
        "ayah_no_ring": ayahNoRing,
        "ibu_no_ring": ibuNoRing,
    };
}
