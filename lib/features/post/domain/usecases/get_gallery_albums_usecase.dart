import 'package:photo_gallery/photo_gallery.dart';
import 'package:socialfy/features/post/domain/repositories/gallery_repository.dart';
class GetGalleryAlbumsUseCase {
  final GalleryRepository _galleryRepository;
  GetGalleryAlbumsUseCase(this._galleryRepository);
  Future<List<Album>> call() async =>
      _galleryRepository.getAlbumsFromGallery();
}