import 'package:photo_gallery/photo_gallery.dart';
import 'package:socialfy/features/post/domain/repositories/gallery_repository.dart';
class GetAlbumImagesUseCase {
  final GalleryRepository _galleryRepository;
  GetAlbumImagesUseCase(this._galleryRepository);
  Future<MediaPage> call(Album selectedAlbum) async =>
      _galleryRepository.getImagesFromGallery(selectedAlbum);
}