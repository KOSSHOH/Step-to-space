import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/bloc/story_bloc.dart';
import 'package:shopping_figma_one/src/model/story_model.dart';

class StoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoryScreenState();
  }
}

class _StoryScreenState extends State<StoryScreen> {
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
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
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
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
