import 'package:socialfy/features/post/data/models/image_model.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';

class GetImageFromGalleryUseCase{
  PostRepository postRepository;
  GetImageFromGalleryUseCase({required this.postRepository});
  Future<List<FileModel>> call()async{
    return postRepository.getImageFromGallery();
  }
}