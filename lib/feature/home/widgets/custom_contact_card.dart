import 'dart:io';

import 'package:contact_app/core/models/contact_model.dart';
import 'package:contact_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CustomContactCard extends StatelessWidget {
  final ContactModel contact;
  final ValueChanged<int> onDelete;
  final int index;
  const CustomContactCard({super.key, required this.contact, required this.onDelete, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 177,
      height: 286,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // User Image
          Expanded(
            flex: 6,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                contact.imagePath == null ?
                Center(child: const Icon(Icons.person, size: 60)) :
                Image.file(
                  File(contact.imagePath!),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7 ,bottom: 8),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: contact.imagePath == null ? AppColors.red :AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                      child: Text(contact.name,style: AppStyles.titleFive.copyWith(
                        color: AppColors.backGroundColor,
                      ),),
                  ),
                ),
              ],
            ),
          ),
          //User Information
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 17,left: 6,right: 6),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.email,size: 20,),
                      SizedBox(width: 8,),
                      Expanded(child: Text(contact.email,style: AppStyles.titleSix.copyWith(color: AppColors.backGroundColor),))
                    ],
                  ),
                  SizedBox(height: 6,),
                  Row(
                    children: [
                      Icon(Icons.phone_in_talk,size: 20,),
                      SizedBox(width: 8,),
                      Expanded(child: Text(contact.phone,style: AppStyles.titleSix.copyWith(color: AppColors.backGroundColor),)),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                        onPressed: (){
                          onDelete(index);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 31),

                          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
                          backgroundColor: AppColors.red,
                          foregroundColor: AppColors.primaryColor,
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete),
                            Text("Delete",style: AppStyles.titleSix,),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
