
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/layout/social_app/cubit/states.dart';

import '../../../models/social_app/post_model.dart';
import '../../../models/social_app/social_user_model.dart';
import '../../../models/user/user_model.dart';
import '../../../modules/social_app/chats/chats_screen.dart';
import '../../../modules/social_app/feeds/feeds_screen.dart';
import '../../../modules/social_app/new_post/new_post_screen.dart';
import '../../../modules/social_app/settings/setting_screen.dart';
import '../../../modules/social_app/users/users_screen.dart';
import '../../../shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart'as Firebase_storage;

class SocialCubit extends Cubit<SocialStates>{
  SocialCubit():super(SocialInitialState());

  static SocialCubit get(context)=>BlocProvider.of(context);
  SocialUserModel? userModel;

  void getUserData()
  {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel=SocialUserModel.fromjson(value.data()!);
     // print(value.data());
      emit(SocialGetUserSuccessState());
    }).catchError((error){
        print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  int currentIndex=0;
  void changeBottomNav(int index)
  {
    if(index==1)
      {
        getUsers();
      }
   // currentIndex=index;
    if(index==2)
      {
        emit(SocialNewPostState());
      }
    else
      {
        currentIndex=index;
        emit(SocialChangeBottomNavState());
      }

  }
  List<Widget>screens=[
    FeedsScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UserScreen(),
    SettingScreen(),
  ];
  List<String>titles=[
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  //io.File? imageFile;
  File? profileImage;
  var picker=ImagePicker();

  Future<void> getProfileImage()async
  {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if(pickedFile!=null)
    {
      profileImage=File(pickedFile.path);
      print(pickedFile.path);
     // profileImage = File(pickedFile!.path);
      // profileImage = (pickedFile);
     // profileImage=XFile(pickedFile.path);
      //File(pickedFile.path);
     // print(pickedFile!.path);
     // profileImage=pickedFile;
     //  profileImage.file(
     //    File(
     //        pickedFile!.path
     //    ),
     //    //  width: 400,
     //    //  height: size.width*.5,
     //  );
     // profileImage= File([], pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
      //image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
      // image=File(pickedFile.path);
      // image=File( pickedFile.path,width:400,height:400);
    }
    else
    {
      print('No image selected');
      emit(SocialProfileImagePickedErrorState());
    }
///data/user/0/com.example.untitled/cache/88d07c87-b1aa-433c-b9ae-08fa519d2d58/خلفيات-بنات-6.jpg
  }

  File? coverImage;

  Future<void> getCoverImage()async
  {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if(pickedFile!=null)
    {
      coverImage=File(pickedFile.path);
      // profileImage = File(pickedFile!.path);
      // profileImage = (pickedFile);
      // profileImage=XFile(pickedFile.path);
      //File(pickedFile.path);
      // print(pickedFile!.path);
      // profileImage=pickedFile;
      //  profileImage.file(
      //    File(
      //        pickedFile!.path
      //    ),
      //    //  width: 400,
      //    //  height: size.width*.5,
      //  );
      // profileImage= File([], pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
      //image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
      // image=File(pickedFile.path);
      // image=File( pickedFile.path,width:400,height:400);
    }
    else
    {
      print('No image selected');
      emit(SocialCoverImagePickedErrorState());
    }

  }
  //خلفيات-بنات-6.jpg
 // String profileImageUrl='';
  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
})
  {
    emit(SocialUserUpdateLoadingState());
    Firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
          value.ref.getDownloadURL().then((value) {
           // emit(SocialUploadProfileImageSuccessState());
            print(value);
            updateUser(name: name, phone: phone, bio: bio,image: value);
           // profileImageUrl=value;
          }).catchError((error) {
            emit(SocialUploadProfileImageErrorState());
          });
    }).catchError((error){
      emit(SocialUploadProfileImageErrorState());
    });


  }

 // String coverImageUrl='';
  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
})
  {
    emit(SocialUserUpdateLoadingState());
    Firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
       // emit(SocialUploadCoverImageSuccessState());
        print(value);
        updateUser(name: name, phone: phone, bio: bio,cover: value);
      //  coverImageUrl=value;
      }).catchError((error) {
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((error){
      emit(SocialUploadCoverImageErrorState());
    });


  }

//   void updateUserImages({
//     required String name,
//     required String phone,
//     required String bio,
// })
//   {
//     emit(SocialUserUpdateLoadingState());
//     if(coverImage!=null)
//       {
//         uploadCoverImage();
//       }
//     else if(profileImage!=null)
//       {
//         uploadProfileImage();
//       }
//     else if(coverImage!=null&&profileImage!=null)
//       {
//
//       }
//     else
//       {
//         updateUser(name: name, phone: phone, bio: bio);
//       }
//
//   }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,

})
  {
    SocialUserModel model=SocialUserModel(
      name: name,
      email: userModel?.email,
      cover:cover??userModel?.cover,
      image:image?? userModel?.image,
      phone: phone,
      uId: userModel?.uId,
      isEmailVerified: false,
      bio: bio,


    );

    FirebaseFirestore
        .instance
        .collection('users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();

    }).catchError((error){
      emit(SocialUserUpdateErrorState());
    });
  }

  File? postImage;

  Future<void> getPostImage()async
  {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if(pickedFile!=null)
    {
      postImage=File(pickedFile.path);


      emit(SocialPostImagePickedSuccessState());

    }
    else
    {
      print('No image selected');
      emit(SocialPostImagePickedErrorState());
    }

  }

  void removePostImage()
  {
    postImage=null;
    emit(SocialRemovePostImageState());
  }

  void uploadPostImage({

    required String dateTime,
    required String text
  })
  {
    emit(SocialCreatePostLoadingState());
    Firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SocialUploadCoverImageSuccessState());
        print(value);
        createPost(dateTime: dateTime, text: text,postImage: value);
       // updateUser(name: name, phone: phone, bio: bio,cover: value);
        //  coverImageUrl=value;
      }).catchError((error) {
        emit(SocialCreatePostErrorState());
      });
    }).catchError((error){
      emit(SocialUploadCoverImageErrorState());
    });


  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,

  })
  {
    emit(SocialCreatePostLoadingState());
    PostModel model=PostModel(
      name: userModel?.name,
      image: userModel?.image,
      uId: userModel?.uId,
      text: text,
      postImage: postImage??'',
      dateTime: dateTime,
    );

    FirebaseFirestore
        .instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
          emit(SocialCreatePostSuccessState());
    }).catchError((error){
      emit(SocialCreatePostErrorState());
    });
  }

  List<PostModel>posts=[];
  List<String> postsId=[];
  List<int>likes=[];
  void getPosts(){
    FirebaseFirestore
        .instance
        .collection('posts')
        .get()
        .then((value) {
          value.docs.forEach((element) {

            element
                .reference
                .collection('likes')
                .get()
                .then((value) {
                  likes.add(value.docs.length);
                  postsId.add(element.id);
                  posts.add(PostModel.fromjson(element.data()));
            })
                .catchError((error){});


          });
           emit(SocialGetPostSuccessState());
    })
        .catchError((error){
          emit(SocialGetPostErrorState(error.toString()));
    });

  }

  void likePost(String postId)
  {
    FirebaseFirestore
        .instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel?.uId)
        .set({
      'likes':true
    }).then((value) {
          emit(SocialLikePostSuccessState());
    }).catchError((error){
          emit(SocialLikePostErrorState(error.toString()));
    });
  }

  List<SocialUserModel>users=[];
  void getUsers(){
  //  users=[];
    if(users.length==0)
     FirebaseFirestore
        .instance
        .collection('users')
        .get()
        .then((value) {
            value.docs.forEach((element) {
            //  if(element.data()['uId']!=userModel?.uId)
             users.add(SocialUserModel.fromjson(element.data()));


      });
      emit(SocialGetAllUserSuccessState());
    })
        .catchError((error){
      emit(SocialGetAllUserErrorState(error.toString()));
    });

  }
}




