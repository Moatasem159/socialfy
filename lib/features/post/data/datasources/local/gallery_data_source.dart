import 'package:photo_gallery/photo_gallery.dart';
abstract class GalleryLocalDataSource{
  Future<List<Album>> getAlbumsFromGallery();
  Future<MediaPage> getImagesFromGallery(Album selectedAlbum);
}
class GalleryLocalDataSourceImpl implements GalleryLocalDataSource{
  @override
  Future<List<Album>> getAlbumsFromGallery()async{
    return await PhotoGallery.listAlbums(mediumType: MediumType.image);
  }
  @override
  Future<MediaPage> getImagesFromGallery(Album selectedAlbum) async{
    return await selectedAlbum.listMedia();
  }
}