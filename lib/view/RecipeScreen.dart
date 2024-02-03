// ignore_for_file: file_names

import 'package:bloc_practice/bloc/apibloc.dart';
import 'package:bloc_practice/bloc/apistate.dart';
import 'package:bloc_practice/utils/appColors.dart';
import 'package:bloc_practice/utils/styles.dart';
import 'package:bloc_practice/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeScreen extends StatelessWidget {
  final String imageUrl;
  final String title;

  const RecipeScreen({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: BlocBuilder<RecipeBloc, GetRecipeState>(
          builder: (context, state) {
            if (state.data.isEmpty) {
              return Center(
                child: MyText.heading(text: 'No Data', color: blackColor),
              );
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: backgroundColor,
                  expandedHeight: 400,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Styles.container(
                        child: Column(
                          children: [
                            Styles.plate(
                                imageUrl: imageUrl, height: 300, width: 300),
                          MyText.heading(text: title)
                          ],
                        ),
                        width: 300,
                        height: 300),
                    // title: ,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final step = state.data[0].steps;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // indexing all the values in ingredient using for loop
                            MyText.heading(
                                text: 'Step ${step![index].number}:',
                                color: blackColor),
                            for (int j = 0;
                                j < step[index].equipment!.length;
                                j++)
                              MyText.body(
                                  text:
                                      'Equipments: ${step[index].equipment![j].name}:',
                                  color: blackColor),
                            for (int i = 0;
                                i < step[index].ingredients!.length;
                                i++)
                              MyText.body(
                                  text:
                                      'Ingredients: ${step[index].ingredients![i].name}',
                                  color: blackColor),
                            MyText.body(
                                text: 'Now: ${step[index].step}',
                                color: blackColor),
                          ],
                        );
                      },
                      childCount: state.data[0].steps?.length ?? 0,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
