import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pilkada/models/Desa.dart';
import 'package:pilkada/models/Kabupaten.dart';
import 'package:pilkada/models/Kecamatan.dart';
import 'package:pilkada/models/Tps.dart';
import 'package:pilkada/models/dashboard.dart';
import 'package:pilkada/models/dataKordinator.dart';
import 'package:pilkada/models/datadaerah.dart';
import 'package:pilkada/models/datagruprelawan.dart';
import 'package:pilkada/models/datakandidat.dart';
import 'package:pilkada/models/dataprofile.dart';
import 'package:pilkada/models/datarelawanutama.dart';
import 'package:http_parser/http_parser.dart';
import 'package:pilkada/models/saksitps.dart';
import '../models/Datadpt.dart';
import '../models/Provinsi.dart';
import '../models/berita.dart';
import '../models/dataaksesoris.dart';
import '../models/datajenisaksesoris.dart';
import '../models/datakordinatorkomunitas.dart';
import '../models/dataperolehansuara.dart';
import '../models/semuadatakecurangan.dart';

class Authentication {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> gettoken() async {
    var value = await storage.read(key: 'token');
    return value;
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<List<DataKabupaten>?> getdatakabupaten() async {
    var user = await http.get(
      Uri.parse(
          'https://websisfopilkada.taekwondosulsel.info/api/index/kabupaten'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataKabupaten> alluser =
        data.map((e) => DataKabupaten.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataProvinsi>?> getdataprovinsi() async {
    var user = await http.get(
      Uri.parse(
          'https://websisfopilkada.taekwondosulsel.info/api/index/provinsi'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataProvinsi> alluser =
        data.map((e) => DataProvinsi.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataBerita>?> getdataberita() async {
    var user = await http.get(
      Uri.parse(
          'https://websisfopilkada.taekwondosulsel.info/api/index/berita'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataBerita> alluser = data.map((e) => DataBerita.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataBerita>?> caridataberita({String? cari}) async {
    var user = await http.get(
      Uri.parse(
          'https://websisfopilkada.taekwondosulsel.info/api/berita/cari?cari=$cari'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataBerita> alluser = data.map((e) => DataBerita.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataKecamatan>?> getdatakecamatan() async {
    var user = await http.get(
      Uri.parse(
          'https://websisfopilkada.taekwondosulsel.info/api/index/kecamatan'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    List<DataKecamatan> alluser =
        data.map((e) => DataKecamatan.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataDesa>?> getdatadesa() async {
    var user = await http.get(
      Uri.parse(
          'https://websisfopilkada.taekwondosulsel.info/api/index/kelurahan'),
    );

    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    List<DataDesa> alluser = data.map((e) => DataDesa.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataRelawanUtama>?> getdatarelawanutama(String id) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/relawanUtama?page=$id'),
        headers: {'Authorization': token.toString()});
    Iterable data =
        (jsonDecode(user.body) as Map<String, dynamic>)['data']['data'];

    List<DataRelawanUtama> alluser =
        data.map((e) => DataRelawanUtama.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataRelawanUtama>?> getdetailrelawan({String? id}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/detail/relawanUtama/$id'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataRelawanUtama> alluser =
        data.map((e) => DataRelawanUtama.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataRelawanUtama>?> carirelawanutama({String cari = ''}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/relawanutama/cari?cari=$cari'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataRelawanUtama> alluser =
        data.map((e) => DataRelawanUtama.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataRelawanUtama>?> getdatarelawanbiasa(
      {String page = ''}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/relawanBiasa?page=$page'),
        headers: {'Authorization': token.toString()});
    Iterable data =
        (jsonDecode(user.body) as Map<String, dynamic>)['data']['data'];

    List<DataRelawanUtama> alluser =
        data.map((e) => DataRelawanUtama.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataRelawanUtama>?> getsemuadatarelawanbiasa(
      {String page = ''}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/allDataRelawanBiasa/relawanBiasa'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataRelawanUtama> alluser =
        data.map((e) => DataRelawanUtama.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataRelawanUtama>?> carirelawanbiasa({String cari = ''}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/RelawanBiasa/cari?cari=$cari'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataRelawanUtama> alluser =
        data.map((e) => DataRelawanUtama.fromJson(e)).toList();

    return alluser;
  }

  Future<List<Datatps>?> getdatatps(String id) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/tps?page=$id'),
        headers: {'Authorization': token.toString()});
    Iterable data =
        (jsonDecode(user.body) as Map<String, dynamic>)['data']['data'];

    List<Datatps> alluser = data.map((e) => Datatps.fromJson(e)).toList();

    return alluser;
  }

  Future<List<Datatps>?> caridatatps({String? cari}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/tps/cari?cari=$cari'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<Datatps> alluser = data.map((e) => Datatps.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataGruprelawan>?> getdatagruprelawan() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/gruprelawan'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataGruprelawan> alluser =
        data.map((e) => DataGruprelawan.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataSaksi>?> getdatasaksi(String page) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/saksi?page=$page'),
        headers: {'Authorization': token.toString()});
    Iterable data =
        (jsonDecode(user.body) as Map<String, dynamic>)['data']['data'];

    List<DataSaksi> alluser = data.map((e) => DataSaksi.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataSaksi>?> caridatasaksi({String? cari}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/saksi/cari?cari=$cari'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataSaksi> alluser = data.map((e) => DataSaksi.fromJson(e)).toList();

    return alluser;
  }

  Future<bool> createkoordinator(
      {String? nama,
      String? nik,
      String? alamat,
      String? jkl,
      String? agama,
      String? no_wa,
      File? photo,
      File? scan_ktp,
      String? Province_id,
      String? regency_id,
      String? district_id,
      String? villages_id}) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://websisfopilkada.taekwondosulsel.info/api/store/kordinator';

    var formdata = FormData.fromMap({
      'nama': nama,
      'nik': nik,
      'alamat': alamat,
      'jkl': jkl,
      'agama': agama,
      'no_wa': no_wa,
      'scan_ktp': scan_ktp,
      'photo': photo,
      'Province_id': Province_id,
      'regency_id': regency_id,
      'district_id': district_id,
      'villages_id': villages_id
    });
    var filefoto = await MultipartFile.fromFile(photo!.path.toString(),
        filename: (photo.path),
        contentType: MediaType('image', (photo.path.toString())));

    var filektp = await MultipartFile.fromFile(scan_ktp!.path.toString(),
        filename: (scan_ktp.path),
        contentType: MediaType('image', (scan_ktp.path.toString())));
    formdata.files.add(MapEntry('photo', filefoto));
    formdata.files.add(MapEntry('scan_ktp', filektp));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );
    print(response);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createkoordinatorkelurahan(
      {String? nama,
      String? nik,
      String? alamat,
      String? jkl,
      String? agama,
      String? no_wa,
      File? photo,
      File? scan_ktp,
      String? Province_id,
      String? regency_id,
      String? district_id,
      String? villages_id}) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://websisfopilkada.taekwondosulsel.info/api/store/kordinator-kelurahan';

    var formdata = FormData.fromMap({
      'nama': nama,
      'nik': nik,
      'alamat': alamat,
      'jkl': jkl,
      'agama': agama,
      'no_wa': no_wa,
      'scan_ktp': scan_ktp,
      'photo': photo,
      'Province_id': Province_id,
      'regency_id': regency_id,
      'district_id': district_id,
      'villages_id': villages_id
    });
    var filefoto = await MultipartFile.fromFile(photo!.path.toString(),
        filename: (photo.path),
        contentType: MediaType('image', (photo.path.toString())));

    var filektp = await MultipartFile.fromFile(scan_ktp!.path.toString(),
        filename: (scan_ktp.path),
        contentType: MediaType('image', (scan_ktp.path.toString())));
    formdata.files.add(MapEntry('photo', filefoto));
    formdata.files.add(MapEntry('scan_ktp', filektp));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );
    print(response);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createpenerimaaksesoris(
      {String? relawanbiasas_id,
      String? jenis_aksesoris,
      String? tanggal_terima,
      File? foto_bukti,
      String? Province_id,
      String? regency_id,
      String? district_id,
      String? villages_id}) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://websisfopilkada.taekwondosulsel.info/api/store/penerimaAksesoris';

    var formdata = FormData.fromMap({
      'relawanbiasas_id': relawanbiasas_id,
      'jenis_aksesoris': jenis_aksesoris,
      'tanggal_terima': tanggal_terima,
      'foto_bukti': foto_bukti,
      'Province_id': Province_id,
      'regency_id': regency_id,
      'district_id': district_id,
      'villages_id': villages_id
    });
    var filefoto = await MultipartFile.fromFile(foto_bukti!.path.toString(),
        filename: (foto_bukti.path),
        contentType: MediaType('image', (foto_bukti.path.toString())));

    formdata.files.add(MapEntry('foto_bukti', filefoto));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );
    print(response);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createkecurangan(
      {String? nama_kecurangan,
      String? deskripsi,
      String? tps_id,
      File? fotoBukti_kecurangan,
      String? Province_id,
      String? regency_id,
      String? district_id,
      String? villages_id}) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://websisfopilkada.taekwondosulsel.info/api/store/kecurangan';

    var formdata = FormData.fromMap({
      'nama_kecurangan': nama_kecurangan,
      'deskripsi': deskripsi,
      'tps_id': tps_id,
      'fotoBukti_kecurangan': fotoBukti_kecurangan,
      'Province_id': Province_id,
      'regency_id': regency_id,
      'district_id': district_id,
      'villages_id': villages_id
    });
    var filefoto = await MultipartFile.fromFile(
        fotoBukti_kecurangan!.path.toString(),
        filename: (fotoBukti_kecurangan.path),
        contentType:
            MediaType('image', (fotoBukti_kecurangan.path.toString())));

    formdata.files.add(MapEntry('fotoBukti_kecurangan', filefoto));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );
    print(response);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createsaksi({
    String? nama_saksi,
    String? nik,
    String? alamat,
    String? no_hp,
    String? email,
    File? saksi,
    String? Province_id,
    String? regency_id,
    String? district_id,
    String? tps_id,
    String? role,
    String? password,
  }) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://websisfopilkada.taekwondosulsel.info/api/store/saksi';

    var formdata = FormData.fromMap({
      'nama_saksi': nama_saksi,
      'nik': nik,
      'alamat': alamat,
      'no_hp': no_hp,
      'email': email,
      'saksi': saksi,
      'Province_id': Province_id,
      'regency_id': regency_id,
      'district_id': district_id,
      'tps_id': tps_id,
      'role': role,
      'password': password
    });
    var filefoto = await MultipartFile.fromFile(saksi!.path.toString(),
        filename: (saksi.path),
        contentType: MediaType('image', (saksi.path.toString())));

    formdata.files.add(MapEntry('foto', filefoto));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );
    print(response);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createkandidat({
    String? no_kandidat,
    String? nama_kandidat,
    String? nama_wakil,
    String? visi_misi,
    String? program,
    File? foto,
  }) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://websisfopilkada.taekwondosulsel.info/api/store/kandidat';

    var formdata = FormData.fromMap({
      'no_kandidat': no_kandidat,
      'nama_kandidat': nama_kandidat,
      'nama_wakil': nama_wakil,
      'visi_misi': visi_misi,
      'program': program,
      'foto': foto
    });
    var filefoto = await MultipartFile.fromFile(foto!.path.toString(),
        filename: (foto.path),
        contentType: MediaType('image', (foto.path.toString())));

    formdata.files.add(MapEntry('foto', filefoto));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );
    print(response);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> createrelawanUtama(
      {String? nama,
      String? nik,
      String? alamat,
      String? jkl,
      String? agama,
      String? no_wa,
      File? scan_ktp,
      File? photo,
      String? Province_id,
      String? regency_id,
      String? district_id,
      String? villages_id}) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://websisfopilkada.taekwondosulsel.info/api/store/relawanUtama';

    var formdata = FormData.fromMap({
      'nama': nama,
      'nik': nik,
      'jkl': jkl,
      'alamat': alamat,
      'scan_ktp': scan_ktp,
      'agama': agama,
      'no_wa': no_wa,
      'photo': photo,
      'Province_id': Province_id,
      'regency_id': regency_id,
      'district_id': district_id,
      'villages_id': villages_id
    });
    var filefoto = await MultipartFile.fromFile(photo!.path.toString(),
        filename: (photo.path),
        contentType: MediaType('image', (photo.path.toString())));

    var filektp = await MultipartFile.fromFile(scan_ktp!.path.toString(),
        filename: (scan_ktp.path),
        contentType: MediaType('image', (scan_ktp.path.toString())));

    formdata.files.add(MapEntry('photo', filefoto));
    formdata.files.add(MapEntry('scan_ktp', filektp));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );

    dio.options.validateStatus = (status) {
      return true;
    };

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> createrelawanBiasa(
      {String? nama,
      String? nik,
      String? alamat,
      String? jkl,
      String? agama,
      String? no_wa,
      File? scan_ktp,
      File? photo,
      String? Province_id,
      String? regency_id,
      String? district_id,
      String? villages_id}) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://websisfopilkada.taekwondosulsel.info/api/store/relawanBiasa';

    var formdata = FormData.fromMap({
      'nama': nama,
      'nik': nik,
      'jkl': jkl,
      'alamat': alamat,
      'scan_ktp': scan_ktp,
      'agama': agama,
      'no_wa': no_wa,
      'photo': photo,
      'Province_id': Province_id,
      'regency_id': regency_id,
      'district_id': district_id,
      'villages_id': villages_id
    });
    var filefoto = await MultipartFile.fromFile(photo!.path.toString(),
        filename: (photo.path),
        contentType: MediaType('image', (photo.path.toString())));

    var filektp = await MultipartFile.fromFile(scan_ktp!.path.toString(),
        filename: (scan_ktp.path),
        contentType: MediaType('image', (scan_ktp.path.toString())));

    formdata.files.add(MapEntry('photo', filefoto));
    formdata.files.add(MapEntry('scan_ktp', filektp));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );

    dio.options.validateStatus = (status) {
      return true;
    };

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> posttps(
      {String? province_id,
      String? regency_id,
      String? district_id,
      String? tps,
      String? ket}) async {
    var token = await gettoken();
    var postdata = await http.post(
        Uri.parse('https://websisfopilkada.taekwondosulsel.info/api/store/tps'),
        headers: {
          'Authorization': token.toString()
        },
        body: {
          'Province_id': province_id,
          'regency_id': regency_id,
          'district_id': district_id,
          'tps': tps,
          'ket': ket
        });
    if (postdata.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updatepass({
    String? email,
    String? id,
    String? password,
    String? name,
  }) async {
    var token = await gettoken();
    var postdata = await http.post(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/update/user/$id'),
        headers: {
          'Authorization': token.toString()
        },
        body: {
          'email': email,
          'password': password,
          'name': name,
        });
    if (postdata.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<DataKordinator>?> getdatakordinator(String id) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/kordinator?page=$id'),
        headers: {'Authorization': token.toString()});
    Iterable data =
        (jsonDecode(user.body) as Map<String, dynamic>)['data']['data'];

    List<DataKordinator> alluser =
        data.map((e) => DataKordinator.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataKordinator>?> getkordinatorkelurahan(String id) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/kordinator-kelurahan?page=$id'),
        headers: {'Authorization': token.toString()});
    Iterable data =
        (jsonDecode(user.body) as Map<String, dynamic>)['data']['data'];

    List<DataKordinator> alluser =
        data.map((e) => DataKordinator.fromJson(e)).toList();

    return alluser;
  }

  Future<List<SemuaDataKecurangan>?> getsemuadatakecurangan(String page) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/kecurangan?=$page'),
        headers: {'Authorization': token.toString()});
    Iterable data =
        (jsonDecode(user.body) as Map<String, dynamic>)['data']['data'];

    List<SemuaDataKecurangan> alluser =
        data.map((e) => SemuaDataKecurangan.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataKordinator>?> caridatakordinator({String? cari}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/kordinator/cari?cari=$cari'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataKordinator> alluser =
        data.map((e) => DataKordinator.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataKordinator>?> carikoordinatorkelurahan({String? cari}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/kordinator-kelurahan/cari?cari=$cari'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataKordinator> alluser =
        data.map((e) => DataKordinator.fromJson(e)).toList();

    return alluser;
  }

  Future<List<Dataaksesoris>?> caripenerimaaksesoris({String? cari}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/penerimaAksesoris/cari?cari=$cari'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<Dataaksesoris> alluser =
        data.map((e) => Dataaksesoris.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataJenisaksesoris>?> carijenisksesoris({String? cari}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/jenisaksesoris/cari?cari=$cari'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataJenisaksesoris> alluser =
        data.map((e) => DataJenisaksesoris.fromJson(e)).toList();

    return alluser;
  }

  Future<List<Datadpt>?> getdatadpt() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse('https://websisfopilkada.taekwondosulsel.info/api/index/dpt'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<Datadpt> alluser = data.map((e) => Datadpt.fromJson(e)).toList();

    return alluser;
  }

  Future<List<Datadpt>?> caridatadpt({String? cari}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/dpt/cari?cari=$cari'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<Datadpt> alluser = data.map((e) => Datadpt.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataKandidat>?> getdatakandidat({String page = ''}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/kandidat?page=$page'),
        headers: {'Authorization': token.toString()});
    Iterable data =
        (jsonDecode(user.body) as Map<String, dynamic>)['data']['data'];

    List<DataKandidat> alluser =
        data.map((e) => DataKandidat.fromJson(e)).toList();

    return alluser;
  }

  Future<List<Dataaksesoris>?> getdataaksesoris(String page) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/penerimaAksesoris?=$page'),
        headers: {'Authorization': token.toString()});
    Iterable data =
        (jsonDecode(user.body) as Map<String, dynamic>)['data']['data'];

    List<Dataaksesoris> alluser =
        data.map((e) => Dataaksesoris.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataJenisaksesoris>?> getdatajenisaksesoris() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/jenisaksesoris'),
        headers: {'Authorization': token.toString()});
    Iterable data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];

    List<DataJenisaksesoris> alluser =
        data.map((e) => DataJenisaksesoris.fromJson(e)).toList();

    return alluser;
  }

  Future<SemuaDaerah> getprovkabupatenkecamatan(
      {String provinsi = '11',
      String gruprelawan = '1',
      String kabupaten = '1101',
      String kecamatan = '1101010'}) async {
    var dataprovinsi = await getdataprovinsi();
    var datagruprelawan = await getdatagruprelawan();
    var datakabupaten = await getdatakabupaten();
    var datakecamatan = await getdatakecamatan();
    var kabupatenbaru = datakabupaten!
        .firstWhere((e) => e.id.toString() == kabupaten)
        .name
        .toString();

    var provinsibaru = dataprovinsi!
        .firstWhere((e) => e.id.toString() == provinsi)
        .name
        .toString();
    var gruprelawang = datagruprelawan!
        .firstWhere((e) => e.id.toString() == gruprelawan)
        .nama_grup
        .toString();
    var kecamatanbaru = datakecamatan!
        .firstWhere((e) => e.id.toString() == kecamatan)
        .name
        .toString();

    return SemuaDaerah(
        gruprelawan: gruprelawang,
        provinsi: provinsibaru,
        kecamatan: kecamatanbaru,
        kabupaten: kabupatenbaru);
  }

  Future loginapi(String? email, String? password) async {
    var loginurl = await http.post(
        Uri.parse('https://websisfopilkada.taekwondosulsel.info/api/login'),
        body: {'email': email, 'password': password});

    var data = jsonDecode(loginurl.body)['data']['token'];

    return data;
  }

  Future<DataProfile> getdataprofile() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse('https://websisfopilkada.taekwondosulsel.info/api/user'),
        headers: {'Authorization': token.toString()});
    var data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    var databaru = DataProfile.fromJson(data);

    return databaru;
  }

  Future<Datadashboard> getdatadashboardadmin() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/dashboard'),
        headers: {'Authorization': token.toString()});
    var data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    var databaru = Datadashboard.fromJson(data);
    return databaru;
  }

  Future<Datadashboard> getdatadashboardcalek() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/dashboard/calek'),
        headers: {'Authorization': token.toString()});
    var data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    var databaru = Datadashboard.fromJson(data);
    return databaru;
  }

  Future<Datadashboard> getdatadashboardkordinator() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/dashboard/kordinator'),
        headers: {'Authorization': token.toString()});
    var data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    var databaru = Datadashboard.fromJson(data);
    return databaru;
  }

  Future<Datadashboard> getdatadashboardrelawan() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/dashboard/relawan'),
        headers: {'Authorization': token.toString()});
    var data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    var databaru = Datadashboard.fromJson(data);
    return databaru;
  }

  Future<Datadashboard> getdatadashboardsaksi() async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/dashboard/saksi'),
        headers: {'Authorization': token.toString()});
    var data = (jsonDecode(user.body) as Map<String, dynamic>)['data'];
    var databaru = Datadashboard.fromJson(data);
    return databaru;
  }

  Future<File> getdatapdf({String? userku = '8'}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/pdf/user/$userku'),
        headers: {'Authorization': token.toString()});
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}data.pdf");
    var data = user.bodyBytes;
    await file.writeAsBytes(data, flush: true);

    return file;
  }

  Future<Uint8List> downloadpdf({String? userku = '8'}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/pdf/user/$userku'),
        headers: {'Authorization': token.toString()});
    var dir = await getTemporaryDirectory();
    File file = File("${dir.path}data.pdf");
    var data = user.bodyBytes;
    // await file.writeAsBytes(data, flush: true);

    return data;
  }

  Future<List<String>> getnamagruprelawan({String? nama = ''}) async {
    var data = await getdatagruprelawan();
    var databaru = data!.map((e) => e.nama_grup.toString()).toList();
    print(databaru[0]);
    return databaru;
  }

  Future<List<String>> getkabupatenlist({String provinsi = '73'}) async {
    List<String> itemkabupaten;
    // var dataprovinsi = await getdataprovinsi();
    var datakabupaten = await getdatakabupaten();
    // var item =
    //     dataprovinsi!.firstWhere((e) => e.name.toString() == provinsi).id;
    var databaru = datakabupaten!
        .where((ite) => ite.id.toString().startsWith(provinsi.toString()))
        .toList();

    var data = databaru.map((e) => e.name.toString()).toList();
    itemkabupaten = data;

    return itemkabupaten;
  }

  Future<List<String>> gettpslist({String tps = '7371101005'}) async {
    List<String>? itemtps;
    var datatps = await getdatatps('1');
    var item = datatps!
        .firstWhere((e) => e.villages_id.toString() == tps.toString())
        .nama_tps;
    print(item);
    var databaru = datatps
        .where((ite) => ite.id.toString().startsWith(item.toString()))
        .toList();

    var data = databaru.map((e) => e.nama_tps.toString()).toList();
    return itemtps!;
  }

  Future<List<String>> getrelawanlist({String relawan = ''}) async {
    List<String> itemrelawan;
    var datarelawan = await getsemuadatarelawanbiasa();

    var databaru = datarelawan!.map((e) => e.nama.toString()).toList();
    itemrelawan = databaru;

    return itemrelawan;
  }

  Future<List<String>> getprovinsilist({String provinsi = '11'}) async {
    List<String> itemprovinsi;
    var dataprovinsi = await getdataprovinsi();
    var data = dataprovinsi!.map((e) => e.name.toString()).toList();
    itemprovinsi = data;
    // var datagr = datagruprelawan.map((e) => e.nama_grup.toString()).toList();
    // itemgruprelawan = datagr;
    return itemprovinsi;
  }

  Future<List<String>> getkecamatanlist({String provinsi = '11'}) async {
    List<String> itemkecamatan;
    var datakabupaten = await getdatakabupaten();
    var datakecamatan = await getdatakecamatan();
    var item =
        datakabupaten!.firstWhere((e) => e.name.toString() == provinsi).id;
    var databaru = datakecamatan!
        .where((ite) => ite.id.toString().startsWith(item.toString()))
        .toList();

    var data = databaru.map((e) => e.name.toString()).toList();
    itemkecamatan = data;

    return itemkecamatan;
  }

  Future<List<String>> getaksesorislist({String provinsi = '11'}) async {
    List<String> itemaksesoris;
    var dataaksesoris = await getdatajenisaksesoris();
    print(dataaksesoris);
    var data = dataaksesoris!.map((e) => e.nama_aksesoris.toString()).toList();
    itemaksesoris = data;

    return itemaksesoris;
  }

  Future<List<String>> getdesalist({String provinsi = '11'}) async {
    List<String> itemdesa;
    var datakecamatan = await getdatakecamatan();
    var datadesa = await getdatadesa();
    var item =
        datakecamatan!.firstWhere((e) => e.name.toString() == provinsi).id;
    var databaru = datadesa!
        .where((ite) => ite.id.toString().startsWith(item.toString()))
        .toList();

    var data = databaru.map((e) => e.name.toString()).toList();
    itemdesa = data;

    return itemdesa;
  }

  Future<List<DataPerolehanSuara>?> getdataperolehansuara(String page) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/hps?=$page'),
        headers: {'Authorization': token.toString()});
    Iterable data =
        (jsonDecode(user.body) as Map<String, dynamic>)['data']['data'];

    List<DataPerolehanSuara> alluser =
        data.map((e) => DataPerolehanSuara.fromJson(e)).toList();

    return alluser;
  }

  Future<List<DataKordinatorKomunitas>?> getdatakordinatorkomunitas(
      {String page = ''}) async {
    var token = await gettoken();
    var user = await http.get(
        Uri.parse(
            'https://websisfopilkada.taekwondosulsel.info/api/index/komunitas?page=$page'),
        headers: {'Authorization': token.toString()});
    Iterable data =
        (jsonDecode(user.body) as Map<String, dynamic>)['data']['data'];

    List<DataKordinatorKomunitas> alluser =
        data.map((e) => DataKordinatorKomunitas.fromJson(e)).toList();

    return alluser;
  }

  Future<bool?> createperolehansuara({
    String? jml_suara_sah,
    String? jml_suara_tidaksah,
    File? foto_bukti_perolehan_suara,
    String? Province_id,
    String? regency_id,
    String? district_id,
    String? villages_id,
    String? tps_id,
    File? formulir_c1,
  }) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://websisfopilkada.taekwondosulsel.info/api/store/hps';

    var formdata = FormData.fromMap({
      'jml_suara_sah': jml_suara_sah,
      'jml_suara_tidaksah': jml_suara_tidaksah,
      'foto_bukti_perolehan_suara': foto_bukti_perolehan_suara,
      'Province_id': Province_id,
      'regency_id': regency_id,
      'district_id': district_id,
      'tps_id': tps_id,
      'villages_id': villages_id,
      'formulir_c1': formulir_c1
    });
    var filefoto = await MultipartFile.fromFile(formulir_c1!.path.toString(),
        filename: (formulir_c1.path),
        contentType: MediaType('image', (formulir_c1.path.toString())));
    var filefoto2 = await MultipartFile.fromFile(
        foto_bukti_perolehan_suara!.path.toString(),
        filename: (foto_bukti_perolehan_suara.path),
        contentType:
            MediaType('image', (foto_bukti_perolehan_suara.path.toString())));

    formdata.files.add(MapEntry('formulir_c1', filefoto));
    formdata.files.add(MapEntry('foto_bukti_perolehan_suara', filefoto2));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );

    dio.options.validateStatus = (status) {
      print(status);
      return true;
    };

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> createaksesoris({
    String? nama_aksesoris,
    File? foto,
  }) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl =
        'https://websisfopilkada.taekwondosulsel.info/api/store/jenisaksesoris';

    var formdata =
        FormData.fromMap({'nama_aksesoris': nama_aksesoris, 'foto': foto});
    var filefoto = await MultipartFile.fromFile(foto!.path.toString(),
        filename: (foto.path),
        contentType: MediaType('image', (foto.path.toString())));

    formdata.files.add(MapEntry('foto', filefoto));

    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );

    dio.options.validateStatus = (status) {
      return true;
    };

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
