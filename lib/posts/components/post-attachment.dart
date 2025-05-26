import 'package:flutter/material.dart';
import 'package:mad_1/posts/components/action-button.dart';
import 'package:readmore/readmore.dart';

class PostAttachment extends StatelessWidget {
  const PostAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      color: Colors.transparent,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  spacing: 10,
                  children: <Widget>[
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.5),
                        image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?cs=srgb&dl=pexels-sulimansallehi-1704488.jpg&fm=jpg'), fit: BoxFit.cover)
                      )
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Lihong\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '5h',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black38
                            )
                          )
                        ]
                      )
                    )
                  ]
                ),
                SizedBox(height: 10),
                ReadMoreText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  colorClickableText: Colors.blueAccent,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Read less',
                  moreStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black
                  )
                ),
              ]
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://miro.medium.com/v2/resize:fit:780/1*o3uWxNqRWqE8BooPMtmOMQ.jpeg'),
                fit: BoxFit.cover
              )
            )
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color:  Colors.black12
                )
              )
            ),
            child: Row(
              spacing: 0,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>
              [
                // Expanded(
                //   child: ActionButton(title: 'Like', icon: Icon(Icons.thumb_up_outlined), activeIcon: Icon(Icons.thumb_up))
                // ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: ActionButton(title: 'Like', icon: Icon(Icons.thumb_up_outlined), activeIcon: Icon(Icons.thumb_up))
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: ActionButton(title: 'Comment', icon: Icon(Icons.comment), activeIcon: Icon(Icons.comment))
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: ActionButton(title: 'Share', icon: Icon(Icons.share), activeIcon: Icon(Icons.share))
                )
              ]
            )
          )
        ]
      )
    );
  }
}