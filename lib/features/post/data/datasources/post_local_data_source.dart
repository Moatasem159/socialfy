import 'dart:convert';

import 'package:flutter_storage_path/flutter_storage_path.dart';
import 'package:socialfy/features/post/data/models/image_model.dart';

abstract class PostLocalDataSource{
  Future<dynamic> getImagesFromGallery();
}



class PostLocalDataSourceImpl implements PostLocalDataSource{

  @override
  Future getImagesFromGallery()async  {
    List<FileModel> ?files;
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath!) as List;
    files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    return files;
  }




}




