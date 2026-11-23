import 'dart:io';

import 'package:contact_app/core/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
   XFile? selectedImage;
   Future<void> pickImage()async{
     final XFile? image = await ImagePicker().pickImage(
         source: ImageSource.gallery
     );
     if(image != null){
       setState(() {
         selectedImage = image;
       });
     }

   }
   void submitContact(){
     final contact = ContactModel(
         name: nameController.text,
         email: emailController.text,
         phone: phoneController.text,
         imagePath: selectedImage?.path,
     );
     Navigator.pop(context, contact);
   }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left:  16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.backGroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // image + User Information
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: pickImage,
                      child: Container(
                        height: 146,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1,
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: selectedImage == null ? Assets.images.imageNotPreview.image() :
                            Image.file(
                                File(selectedImage!.path),
                              fit: BoxFit.cover,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  // userName , email , phone
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ValueListenableBuilder<TextEditingValue>(
                            valueListenable: nameController,
                            builder: (context,value,child){
                              return Text(
                                value.text.isEmpty ? "User Name" : value.text,
                                style: AppStyles.titleThree,
                              );
                            }
                        ),
                        Divider(
                          color: AppColors.primaryColor,
                          thickness: 1,
                        ),
                        ValueListenableBuilder<TextEditingValue>(
                            valueListenable: emailController,
                            builder: (context,value,child){
                              return Text(
                                value.text.isEmpty ? "example@email" : value.text,
                                style: AppStyles.titleThree,
                              );
                            }
                        ),
                        Divider(
                          color: AppColors.primaryColor,
                          thickness: 1,
                        ),
                        ValueListenableBuilder<TextEditingValue>(
                            valueListenable: phoneController,
                            builder: (context,value,child){
                              return Text(
                                value.text.isEmpty ? "+2000000000" : value.text,
                                style: AppStyles.titleThree,
                              );
                            }
                        ),
                        Divider(
                          color: AppColors.primaryColor,
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                controller: nameController,
                style: AppStyles.titleThree,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  hintText: "Enter User Name",
                  hintStyle: AppStyles.titleThree,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.38),
              TextField(
                controller: emailController,
                style: AppStyles.titleThree,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  hintText: "Enter User Email",
                  hintStyle: AppStyles.titleThree,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.38),
              TextField(
                controller: phoneController,
                style: AppStyles.titleThree,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  hintText: "Enter User Phone",
                  hintStyle: AppStyles.titleThree,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              //elevated button (Enter user)
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: submitContact,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.backGroundColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    "Enter User",
                    style: AppStyles.titleTwo.copyWith(
                      color: AppColors.backGroundColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
