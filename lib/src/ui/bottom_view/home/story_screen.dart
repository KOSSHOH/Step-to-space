import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/bloc/story_bloc.dart';
import 'package:shopping_figma_one/src/model/story_model.dart';
import 'package:shopping_figma_one/src/ui/item/story_image_item_screen.dart';
import 'package:shopping_figma_one/src/ui/item/story_video_item_screen.dart';

class StoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoryScreenState();
  }
}

class _StoryScreenState extends State<StoryScreen>
    with AutomaticKeepAliveClientMixin<StoryScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    storyBloc.fetchAllStory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: StreamBuilder(
        stream: storyBloc.allStory,
        builder: (context, AsyncSnapshot<List<StoryModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(
                top: 20,
                bottom: 160,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    snapshot.data[index].type == "image"
                        ? Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => StoryImageItemScreen(
                                itemModel: snapshot.data[index],
                              ),
                            ),
                          )
                        : snapshot.data[index].type == "video"
                            ? Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => StoryVideoItemScreen(
                                    itemModel: snapshot.data[index],
                                  ),
                                ),
                              )
                            : null;
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width - 30,
                    margin: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          height: MediaQuery.of(context).size.width - 30,
                          child: Hero(
                            child: Image.asset(
                              snapshot.data[index].image,
                              fit: BoxFit.fill,
                            ),
                            tag: snapshot.data[index],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          padding: EdgeInsets.all(
                            24.0,
                          ),
                          height: MediaQuery.of(context).size.width - 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(child: Container()),
                              snapshot.data[index].type == "video"
                                  ? SvgPicture.asset(
                                      "assets/images/play.svg",
                                    )
                                  : snapshot.data[index].type == "live"
                                      ? Container(
                                          height: 24,
                                          width: 44,
                                          decoration: BoxDecoration(
                                            color: AppTheme.red,
                                            borderRadius: BorderRadius.circular(
                                              6.0,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "LIVE",
                                              style: TextStyle(
                                                fontFamily: AppTheme.fontText,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11,
                                                height: 1.45,
                                                color: AppTheme.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                              SizedBox(height: 8),
                              Text(
                                snapshot.data[index].name,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontText,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  height: 1.4,
                                  color: AppTheme.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              snapshot.data[index].type == "image"
                                  ? Text(
                                      snapshot.data[index].title,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontText,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        height: 1.33,
                                        color: AppTheme.white,
                                      ),
                                    )
                                  : Text.rich(
                                      TextSpan(
                                        children: <InlineSpan>[
                                          WidgetSpan(
                                            child: Container(
                                              height: 16,
                                              width: 16,
                                              child: Hero(
                                                child: Image.asset(
                                                  snapshot
                                                      .data[index].userImage,
                                                  fit: BoxFit.fill,
                                                ),
                                                tag: snapshot
                                                    .data[index].userImage,
                                              ),
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: SizedBox(width: 4),
                                          ),
                                          TextSpan(
                                            text: snapshot.data[index].userName,
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontText,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              height: 1.33,
                                              color: AppTheme.white,
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: SizedBox(width: 8),
                                          ),
                                          TextSpan(
                                            text:
                                                snapshot.data[index].viewCount +
                                                    " Views",
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontText,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12,
                                              height: 1.33,
                                              color: AppTheme.white,
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: SizedBox(width: 8),
                                          ),
                                          TextSpan(
                                            text: snapshot.data[index].time,
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontText,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12,
                                              height: 1.33,
                                              color: AppTheme.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(
                left: 14,
                right: 14,
                top: 20,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: 345,
                  margin: EdgeInsets.only(
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
