import 'package:contact_app/core/models/contact_model.dart';
import 'package:contact_app/core/theme/app_colors.dart';
import 'package:contact_app/core/theme/app_styles.dart';
import 'package:contact_app/feature/home/widgets/custom_bottom_sheet.dart';
import 'package:contact_app/feature/home/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import '../../../core/gen/assets.gen.dart';
import '../widgets/custom_contact_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContactModel> contacts = [];

  void addContact(ContactModel contact){
    setState(() {
      contacts.add(contact);
    });
  }

  void deleteLastContact(){
    setState(() {
      contacts.removeLast();
    });
  }
  void deleteContact(int index){
    setState(() {
      contacts.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Assets.images.logoImg.image(),
              ),
              SizedBox(height: 27,),
              if(contacts.isEmpty)...[
                Padding(
                  padding: const EdgeInsets.only(top: 160.0),
                  child: Assets.images.listPurple.image(),
                ),
                Text(
                  "There is No Contacts Added Here",
                  style: AppStyles.titleOne,
                ),
              ] else...[
                Expanded(
                  child: GridView.builder(
                    itemCount: contacts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 177 / 287,
                      ),
                      itemBuilder: (context , index){
                      return CustomContactCard(
                          contact: contacts[index],
                        onDelete: deleteContact,
                        index: index,

                      );
                      },
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(contacts.isNotEmpty)...[
            CustomFloatingActionButton(
                onPressed: deleteLastContact,
                icon: Icons.delete_rounded,
                backgroundColor: AppColors.red,
                foregroundColor: AppColors.primaryColor,
            ),
            SizedBox(height: 8,),
          ],
          CustomFloatingActionButton(
            onPressed: () {
              showModalBottomSheet<ContactModel>(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return CustomBottomSheet();
                },
              ).then((contact){
                if(contact != null){
                  addContact(contact);
                }
              });
            },
            icon: Icons.add,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.backGroundColor,
          ),
        ],
      ),
    );
  }
}
