import 'package:photo_gallery/photo_gallery.dart';
import 'package:socialfy/features/post/data/datasources/local/gallery_data_source.dart';
import 'package:socialfy/features/post/domain/repositories/gallery_repository.dart';
class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryLocalDataSource _galleryLocalDataSource;
  GalleryRepositoryImpl(this._galleryLocalDataSource);
  @override
  Future<List<Album>> getAlbumsFromGallery() async=>
      await _galleryLocalDataSource.getAlbumsFromGallery();
  @override
  Future<MediaPage> getImagesFromGallery(Album selectedAlbum) async =>
      await _galleryLocalDataSource.getImagesFromGallery(selectedAlbum);
}