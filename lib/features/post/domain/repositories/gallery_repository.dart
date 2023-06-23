import 'package:photo_gallery/photo_gallery.dart';
abstract class GalleryRepository {
  Future<List<Album>> getAlbumsFromGallery();
  Future<MediaPage> getImagesFromGallery(Album selectedAlbum);
}