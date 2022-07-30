// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:projek_akhir3/model/akun.dart';
import 'package:projek_akhir3/model/barang.dart';
import 'package:projek_akhir3/repositories/repository.dart';
import 'package:projek_akhir3/repositories/repositoryAkun.dart';

class CategoryService {
  Repository? _repository;
  RepositoryAkun? _repositoryAkun;

  CategoryService() {
    _repository = Repository();
    _repositoryAkun = RepositoryAkun();
  }

  saveBarang(Barang barang) async {
    return await _repository!.insertData('tableBarang', barang.barangMap());
  }

  readBarang() async {
    return await _repository!.readData('tableBarang');
  }

  updateBarang(Barang barang) async {
    return await _repository!.updateData('tableBarang', barang.barangMap());
  }

  readBarangByID(barangId) async {
    return await _repository!.readDataByID('tableBarang', barangId);
  }

  deleteBarang(barangId) async {
    return await _repository!.deleteData('tableBarang', barangId);
  }

  // AKUN
  saveAkun(Akun akun) async {
    return await _repositoryAkun!.insertAkun('tableAkun', akun.akunMap());
  }

  readAkunByID(password, username) async {
    return await _repositoryAkun!.readDataByID('tableAkun', password, username);
  }
}