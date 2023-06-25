import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:socialfy/features/post/domain/usecases/get_album_images_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/get_gallery_albums_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_state.dart';
class GetGalleryCubit extends Cubit<GetGalleryStates> {
  GetGalleryCubit(this._getGalleryAlbumsUseCase, this._getAlbumImagesUseCase) : super(GetGalleryInitialState());
  final GetGalleryAlbumsUseCase _getGalleryAlbumsUseCase;
  final GetAlbumImagesUseCase _getAlbumImagesUseCase;
  static GetGalleryCubit get(context)=>BlocProvider.of(context);
  final SliverOverlapAbsorberHandle appbar = SliverOverlapAbsorberHandle();
  ScrollController single = ScrollController();
  List<Album> ?albums;
  List<Medium> ?selectedAlbum=[];
  Album? selectedModel;
  Medium? selectedImage;
  File? imageFile;
  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS) {
      if (await Permission.storage.request().isGranted) {
        return true;
      }
    }
    if (Platform.isAndroid) {
      if (await Permission.storage.request().isGranted ||
          await Permission.photos.request().isGranted &&
              await Permission.videos.request().isGranted) {
        return true;
      }
    }
    return false;
  }
  Future<void>getGallery()async{
    emit(GetImagesLoadingState());
    if(await _promptPermissionSetting()){
      await getGalleryAlbum();
      await getAlbumImages(album: albums![0]);
      emit(GetImagesSuccessState());
    }
    else{
      emit(GetImagesErrorState());
    }
  }
  Future<void>getGalleryAlbum()async{
    albums = await _getGalleryAlbumsUseCase.call();
  }
  Future<void> getAlbumImages({required Album album})async{
    selectedModel=album;
    MediaPage mediaPage=await _getAlbumImagesUseCase.call(album);
    selectedAlbum=mediaPage.items;
    selectedImage=selectedAlbum![0];
    getImageFile(selectedImage!);
  }
  Future getImageFile(Medium selectedImage)async{
    imageFile=await selectedImage.getFile();
  }
  changeFolder(value)async{
    emit(ChangeFolderLoadingState());
    await getAlbumImages(album: value);
    emit(ChangeFolderSuccessState());
  }
  changeImage(image){
    emit(ChangeImageLoadingState());
    selectedImage = image;
    getImageFile(selectedImage!);
    single.animateTo(
        0.0,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.fastLinearToSlowEaseIn);
    emit(ChangeImageSuccessState());
  }
}
