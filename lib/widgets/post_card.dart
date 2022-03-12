import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talkr_demo/Services/user.dart';
import 'package:talkr_demo/widgets/like_animation.dart';

class PostCard extends StatefulWidget {
  final snap;
   PostCard({ this.snap });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;
  User2? _user;

  User2 get getUser => _user!;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16).copyWith(right: 0),
          child: Row(children: 
          [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.snap['profImage'])
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.snap['username'],style: const TextStyle(color: Colors.white),)
                    
                    ],
                  ),


            ),),
            IconButton(
              icon: const Icon(Icons.more_vert,color: Colors.white,),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shrinkWrap: true,
                      children: [
                        'Delete',
                      ].map((e) => InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,horizontal: 16,
                          ),
                          child: Text(e),
                        ),
                      )).toList(),
                    ),
                ),);
              
            },),

          ],),
        ),
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                isLikeAnimating = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children:[ SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: double.infinity,
                        child: Image.network(
                          widget.snap['postUrl'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: isLikeAnimating ? 1 : 0,
                        
                        child: LikeAnimation(child: 
                        const Icon(Icons.favorite,color: Colors.white,size: 120,), 
                        isAnimating: isLikeAnimating,
                        duration: const Duration(milliseconds: 400),
                        onEnd: () {
                          setState(() {
                            isLikeAnimating = false;
                          });
                          
                        },
                        ),
                      )
                      
                      ]
                      
            ),
          ),
                  Row(children: [
                    LikeAnimation(
                      isAnimating : false,

                      //isAnimating: widget.snap['likes'],
                      child: IconButton(
                        icon: const Icon(Icons.favorite),
                        onPressed: () {},
                        color: Colors.red,
                        ),
                    ),
                      IconButton(
                      icon: const Icon(Icons.comment_outlined,),
                      onPressed: () {},
                      ),
                      IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {},
                      ),
                      Expanded(
                        child:Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(icon: const Icon(Icons.bookmark_border),
                          onPressed: () {},
                          ),
                        ),
                      )

                  ],),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextStyle(
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w800
                          ),
                          child: Text('${widget.snap['likes'].length} likes',
                          style: Theme.of(context).textTheme.bodyText2
                          )
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            top: 8,
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.white),
                              children: [
                                TextSpan(text: widget.snap['username'],style: const TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: ' ${widget.snap['discription']}',)
                              ]
                            ),
                            ),
                        ),
                        InkWell(
                  child: Container(
                    child: const Text(
                      'View all 200 comments',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                  ),
                  onTap: () {}
                  //  Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => CommentsScreen(
                  //       postId: widget.snap['postId'].toString(),
                  //     ),
                  //   ),
                  // ),
                ),
                Container(
                  child: Text(
                    DateFormat.yMMMd()
                        .format(widget.snap['datePublished'].toDate()),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                ),




                      ],
                    ),
                  )
      ],

      ),
    );
  }
}