import 'package:flutter/material.dart';
import '../../core/constant/common_colors.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key,
      required this.index,
      required this.user,
      required this.isFavoriteScreen});
  final int index;
  final List<Map<String, dynamic>> user;
  final bool isFavoriteScreen;

  @override
  Widget build(BuildContext context) {
    // final String phone = user[index]['phone'];
    // final String firstName = user[index]['firstName'];
    // final String lastName = user[index]['lastName'];
    return
        //  GestureDetector(
        //   onLongPress: () {
        //     Get.to(() => UserProfile(
        //           index: index,
        //           user: user,
        //           isFavoriteScreen: isFavoriteScreen,
        //         ));
        //   },
        Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 8,
        color: index.isEven
            ? CommonColors.buttonColor1
            : CommonColors.buttonColor2,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     Obx(
                    //       () => IconButton(
                    //         onPressed: () async {
                    //           if (GetXDataHandler.favoriteList
                    //               .contains(user[index])) {
                    //             GetXDataHandler.favoriteList.removeWhere(
                    //                 (element) => element == user[index]);
                    //           } else {
                    //             GetXDataHandler.favoriteList.add(user[index]);
                    //           }
                    //         },
                    //         icon: user.isEmpty
                    //             ? CommonIcons.favoriteBorder
                    //             : GetXDataHandler.favoriteList
                    //                     .contains(user[index])
                    //                 ? CommonIcons.favorite
                    //                 : CommonIcons.favoriteBorder,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    const CircleAvatar(
                      radius: 55,
                      // child: Text(
                      // '${firstName[0]}${lastName[0]}',
                      // style: TextStyle(fontSize: 35),
                      // ),
                    ),
                    Text(
                      '${user[index]['id']} | ${user[index]['firstName']} ${user[index]['lastName']}',
                      style: const TextStyle(
                        color: CommonColors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${user[index]['email']}',
                      style: const TextStyle(
                        color: CommonColors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // RichText(
                    //   text: TextSpan(
                    //     children: [
                    //       TextSpan(
                    //         text: CommonString.website,
                    //         style: const TextStyle(
                    //           color: CommonColors.black,
                    //           fontWeight: FontWeight.w700,
                    //         ),
                    //       ),
                    //       TextSpan(
                    //         text: user[index]['website'],
                    //         style: const TextStyle(
                    //           color: CommonColors.black,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Divider(thickness: 2),
                    // RichText(
                    //   text: TextSpan(
                    //     children: [
                    //       TextSpan(
                    //         text: CommonString.address,
                    //         style: const TextStyle(
                    //           color: CommonColors.black,
                    //           fontWeight: FontWeight.w700,
                    //         ),
                    //       ),
                    //       TextSpan(
                    //         text: user[index]['address'],
                    //         style: const TextStyle(
                    //           color: CommonColors.black,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Divider(thickness: 2),
                    // RichText(
                    //   text: TextSpan(
                    //     children: [
                    //       TextSpan(
                    //         text: CommonString.company,
                    //         style: const TextStyle(
                    //           color: CommonColors.black,
                    //           fontWeight: FontWeight.w700,
                    //         ),
                    //       ),
                    //       TextSpan(
                    //         text: user[index]['company'],
                    //         style: const TextStyle(
                    //           color: CommonColors.black,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    Divider(thickness: 2),
                    // Row(
                    //   children: [
                    //     CommonIcons.call,
                    //     Text(
                    //       phone.substring(10),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    // );
  }
}
