import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media_app/widget/story_bar.dart';
import 'package:social_media_app/widget/photo_frame_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 50,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 70 * 30,
            height: 90,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(colors: [
                              Color(0xFFF41C4C),
                              Color(0xFFFC7C34),
                            ]),
                          ),
                          padding: const EdgeInsets.all(2),
                          child: const Icon(Icons.add)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: 90,
                  width: 30 * 67.5,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: storyBar(),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 659,
          child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => const PhotoFrame(),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 5),
        ),
        // PhotoFrame(),
      ],
    );
  }
}

class PhotoFrame extends StatelessWidget {
  const PhotoFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.network(
                      'https://th.bing.com/th/id/OIP.CAbTaFvo9r1nh2uSZgd5yAAAAA?rs=1&pid=ImgDetMain',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: const Text('Ajnas'),
                subtitle: const Text('2 min ago'),
                trailing: const Icon(Icons.more_horiz),
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
            imageUrl:
                "https://i.pinimg.com/originals/a9/d3/61/a9d3611e46cfe8fbe28a8833893e6c03.jpg",
            imageBuilder: (context, imageProvider) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  //image size fill
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              alignment: Alignment.center,
              child: Lottie.asset(
                  'assets/lottie/loader.json'), // you can add pre loader iamge as well to show loading.
            ),
            errorWidget: (context, url, error) =>
                Text('Some thing went wrong'),
            //show no iamge availalbe image on error laoding
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            photoFrameButton(Icons.favorite, '88'),
            const SizedBox(
              width: 12,
            ),
            photoFrameButton(Icons.fmd_good, '88'),
            const SizedBox(
              width: 12,
            ),
            photoFrameButton(Icons.favorite, '88'),
            const SizedBox(
              width: 12,
            ),
            photoFrameButton(Icons.favorite, '88'),
            const SizedBox(
              width: 12,
            ),
            photoFrameButton(Icons.favorite, '88'),
          ],
        ),
      ],
    );
  }
}
