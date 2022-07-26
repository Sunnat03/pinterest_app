import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/profile_image_utill.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  static const String id = '/profile_page';
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController textController = TextEditingController();
  String name = "sunnat";
  String email = "@sunnatmakhmayusupov03";
  int followers = 2003;
  int followings = 5;
  var imagePicker;

  List defaultImage = [
    'https://www.techfunnel.com/wp-content/uploads/2017/12/7-Types-of-Hackers.jpg',
    'https://ichef.bbci.co.uk/news/976/cpsprodpb/2B87/production/_90934111_1-1.jpg',
    'https://www.globalsign.com/application/files/7416/1463/0119/iStock-1152537185.jpg',
    'https://www.oceanpointins.com/wp-content/uploads/2020/02/canstockphoto26807912.jpg',
    'https://www.pandasecurity.com/en/mediacenter/src/uploads/2016/03/pandasecurity-Who-are-the-most-famous-hackers-in-history.jpg',
    'https://media.gettyimages.com/photos/blue-computer-hack-picture-id843466180?s=612x612',
    'https://therecord.media/wp-content/uploads/2021/09/hacker-hoodie-1280x720.jpg',
    'https://www.bleepstatic.com/content/hl-images/2022/05/11/hacker_sebastiaan-stam-unsplash.jpg',
    'https://img.etimg.com/thumb/msid-76304095,width-650,imgsize-124491,,resizemode-4,quality-100/many-belltroxes-delhi-is-now-indias-hacker-hub.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnVs1e_boStRH5X1r5_4p-IM0WnvyaTZ_v6A&usqp=CAU',
    'https://www.bleepstatic.com/content/hl-images/2021/09/03/threat-actor.jpg',
    'https://bestarion.com/wp-content/uploads/2021/03/Web-Developer.jpg',
    'https://res.cloudinary.com/practicaldev/image/fetch/s--_HBZhuhF--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/nweeqf97l2md3tlqkjyt.jpg',
    'https://d3kqdc25i4tl0t.cloudfront.net/articles/content/545_983014_tech.hero.jpg',
    'https://siliconcoder.com/wp-content/uploads/2019/09/web-developer.jpg',
    'https://images.unsplash.com/photo-1617042375876-a13e36732a04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGRldmVsb3BlcnxlbnwwfHwwfHw%3D&w=1000&q=80',
    'https://kinsta.com/wp-content/uploads/2021/07/how-to-become-a-web-developer.jpg',
    'https://thumbs.dreamstime.com/b/back-view-portrait-contemporary-web-developer-writing-code-program-sitting-desk-working-startup-project-modern-116658678.jpg',
    'https://blog.hyperiondev.com/wp-content/uploads/2018/01/Web-Developer-vs-Software-Developer.jpg',
    'https://media.proglib.io/posts/2020/09/15/95ac95628f5e83b6468fa3fb5db2cde0.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjTJ8EI0OGfsIDGXe6VhC8PnOAxAU30kmG-Q&usqp=CAU',
    'https://images.unsplash.com/photo-1522252234503-e356532cafd5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGV2ZWxvcGVyfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    'https://axiomq.com/wp-content/uploads/2020/05/developer-3.jpg',
    'https://t3.ftcdn.net/jpg/03/18/60/62/360_F_318606217_Hk8jo2MVoI33SQOkYrfOF929J7JgIP0P.jpg',
    'https://cdn.seeklearning.com.au/media/images/career-guide/module/developer-module.jpg',
    'https://developer.apple.com/news/images/og/apple-developer-og.png',
  ];

  Future <void> refresh() async {
    setState(() {
      defaultImage = [
        'https://www.techfunnel.com/wp-content/uploads/2017/12/7-Types-of-Hackers.jpg',
        'https://ichef.bbci.co.uk/news/976/cpsprodpb/2B87/production/_90934111_1-1.jpg',
        'https://www.globalsign.com/application/files/7416/1463/0119/iStock-1152537185.jpg',
        'https://www.oceanpointins.com/wp-content/uploads/2020/02/canstockphoto26807912.jpg',
        'https://www.pandasecurity.com/en/mediacenter/src/uploads/2016/03/pandasecurity-Who-are-the-most-famous-hackers-in-history.jpg',
        'https://media.gettyimages.com/photos/blue-computer-hack-picture-id843466180?s=612x612',
        'https://therecord.media/wp-content/uploads/2021/09/hacker-hoodie-1280x720.jpg',
        'https://www.bleepstatic.com/content/hl-images/2022/05/11/hacker_sebastiaan-stam-unsplash.jpg',
        'https://img.etimg.com/thumb/msid-76304095,width-650,imgsize-124491,,resizemode-4,quality-100/many-belltroxes-delhi-is-now-indias-hacker-hub.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnVs1e_boStRH5X1r5_4p-IM0WnvyaTZ_v6A&usqp=CAU',
        'https://www.bleepstatic.com/content/hl-images/2021/09/03/threat-actor.jpg',
        'https://bestarion.com/wp-content/uploads/2021/03/Web-Developer.jpg',
        'https://res.cloudinary.com/practicaldev/image/fetch/s--_HBZhuhF--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/nweeqf97l2md3tlqkjyt.jpg',
        'https://d3kqdc25i4tl0t.cloudfront.net/articles/content/545_983014_tech.hero.jpg',
        'https://siliconcoder.com/wp-content/uploads/2019/09/web-developer.jpg',
        'https://images.unsplash.com/photo-1617042375876-a13e36732a04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGRldmVsb3BlcnxlbnwwfHwwfHw%3D&w=1000&q=80',
        'https://kinsta.com/wp-content/uploads/2021/07/how-to-become-a-web-developer.jpg',
        'https://thumbs.dreamstime.com/b/back-view-portrait-contemporary-web-developer-writing-code-program-sitting-desk-working-startup-project-modern-116658678.jpg',
        'https://blog.hyperiondev.com/wp-content/uploads/2018/01/Web-Developer-vs-Software-Developer.jpg',
        'https://media.proglib.io/posts/2020/09/15/95ac95628f5e83b6468fa3fb5db2cde0.png',
      ];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.black,),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.ellipsisH, color: Colors.black, size: 18,),
                      onPressed: (){},
                    ),
                  ],
                ),
                // profile image
                GestureDetector(
                  onTap: () async {
                    var source = ImageSource.gallery;
                    XFile image = await imagePicker.pickImage(
                        source: source, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
                    setState(() {
                      UpdateProfileImage.setImage(File(image.path));
                    });
                  },

                  child: SizedBox(
                      width: 200,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:  UpdateProfileImage.getImage() != null
                            ? Image.file(
                          UpdateProfileImage.getImage(),
                          fit: BoxFit.cover,
                        )
                            : const Image(
                          image: AssetImage('assets/local/profile_image.png'),
                          fit: BoxFit.cover,
                        ),
                      )
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 35, color: Colors.black),)),
                const SizedBox(
                  height: 12,
                ),
                Center(child: Text(email, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.black),)),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text(followers.toString(), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black))),
                      const SizedBox(
                        width: 5,
                      ),
                      const Center(child: Text("followers", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black))),
                      const SizedBox(
                        width: 5,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 1,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Center(child: Text(followings.toString(), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),)),
                      const SizedBox(
                        width: 5,
                      ),
                      const Center(child: Text("followings", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // text field
                SizedBox(
                  height: 38,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            controller: textController,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {},
                            onSubmitted: (search){},
                            onTap: (){},
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search_sharp,
                                color: Colors.black54,
                              ),

                              filled: true,
                              fillColor: Colors.grey.shade200,
                              hintText: 'Search your Pins',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(45.0)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(45.0)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(45.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, size: 28, color: Colors.black,),
                        onPressed: (){},
                      ),
                      const SizedBox(width: 20)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: MasonryGridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        itemCount: defaultImage.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        itemBuilder: (context, index){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: CachedNetworkImage(
                                  imageUrl: defaultImage[index],
                                  placeholder: (context, url) =>
                                  const Image(image: AssetImage('assets/cash/img.png')),
                                  errorWidget: (context, url, error) =>
                                  const Image(image: AssetImage('assets/cash/img_1.png')),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Align(
                                    child: GestureDetector(
                                      onTap: (){},
                                      child: const Icon(FontAwesomeIcons.ellipsisH, color: Colors.black, size: 17,),
                                    ),
                                    alignment: Alignment.centerRight,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width/2,
                                height: 20,
                              ),
                            ],
                          );
                        }
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}