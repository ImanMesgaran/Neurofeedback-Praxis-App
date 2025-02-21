// import 'package:bright_app/core/assets/icons.dart';
// import 'package:bright_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class BannerPlaceholder extends StatelessWidget {
  const BannerPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
    );
  }
}

class TitlePlaceholder extends StatelessWidget {
  final double width;

  const TitlePlaceholder({
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 12.0,
            color: Colors.white,
          ),
          const SizedBox(height: 8.0),
          Container(
            width: width,
            height: 12.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

enum ContentLineType {
  twoLines,
  threeLines,
}

class ContentPlaceholder extends StatelessWidget {
  final ContentLineType lineType;

  const ContentPlaceholder({
    required this.lineType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Container(
            width: 96.0,
            height: 72.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                if (lineType == ContentLineType.threeLines)
                  Container(
                    width: double.infinity,
                    height: 10.0,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 8.0),
                  ),
                Container(
                  width: 100.0,
                  height: 10.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MultiLineContentPlaceholder extends StatelessWidget {
  final int lines;

  const MultiLineContentPlaceholder({
    required this.lines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 180.0,
                  height: 10.0,
                  color: Colors.white,
                ),
                const SizedBox(height: 30),
                Container(
                  width: 100.0,
                  height: 10.0,
                  color: Colors.white,
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                Container(
                  width: 100.0,
                  height: 10.0,
                  color: Colors.white,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BrowsePlaceHolderWidget extends StatelessWidget {
  const BrowsePlaceHolderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const BrowseListsWidgetSkeleton(),
    );
  }
}

class BrowseListsWidgetSkeleton extends StatelessWidget {
  const BrowseListsWidgetSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: const [
        /// Vidoes
        ContentHorizontalListSkeleton(),

        // Books
        ContentHorizontalListSkeleton(),

        // Articles
        ContentHorizontalListSkeleton(),

        // Audio
        ContentHorizontalListSkeleton(),

        // Events
        ContentHorizontalListSkeleton(),

        // News
        ContentHorizontalListSkeleton(),
      ],
    );
  }
}

class TopicsItemPlaceHolderWidget extends StatelessWidget {
  const TopicsItemPlaceHolderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const TopicsItemPlaceHolderWidgetSkeleton(),
    );
  }
}

class TopicsItemPlaceHolderWidgetSkeleton extends StatelessWidget {
  const TopicsItemPlaceHolderWidgetSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        left: 18,
        top: 18,
      ),
      itemBuilder: (context, index) {
        return Container(
          width: 278,
          height: 180,
          //color: Colors.grey,
          margin: const EdgeInsets.only(right: 18),
          child: Stack(
            children: [
              Container(width: 278, height: 180, color: Colors.grey),
              // Icon
              Positioned(
                top: 25,
                left: 25,
                child: Container(width: 25, height: 25, color: Colors.grey),
              ),
              // Duration
              const Positioned(
                top: 20,
                right: 20,
                child: TitlePlaceholder(width: 40),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ContentHorizontalListSkeleton extends StatelessWidget {
  const ContentHorizontalListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 18, top: 28, bottom: 12),
            child: Row(
              children: [
                Container(width: 100, height: 18, color: Colors.grey),
                Expanded(
                  child: Container(),
                ),
                Container(width: 50, height: 14, color: Colors.grey),
                const SizedBox(width: 18),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                left: 18,
                top: 18,
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: 278,
                  height: 180,
                  //color: Colors.grey,
                  margin: const EdgeInsets.only(right: 18),
                  child: Stack(
                    children: [
                      Container(width: 278, height: 180, color: Colors.grey),
                      // Icon
                      Positioned(
                        top: 25,
                        left: 25,
                        child: Container(
                          width: 25,
                          height: 25,
                          color: Colors.grey,
                        ),
                      ),
                      // Duration
                      const Positioned(
                        top: 20,
                        right: 20,
                        child: TitlePlaceholder(width: 40),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BrowseDetailSkeleton extends StatelessWidget {
  const BrowseDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Stack(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.black26,
              highlightColor: Theme.of(context).cardColor.withOpacity(0.2),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: BackButton(
                color: Colors.white,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
        Container(
          height: 60,
          color: const Color(0xffCFD1E0),
          child: const PostDetailsWidgetHorizontalSkeleton(),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18, left: 18, bottom: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   item.title,
              //   style: Theme.of(context).textTheme.titleLarge,
              // ),
              const SizedBox(height: 8),
              Shimmer.fromColors(
                baseColor: Colors.black26,
                highlightColor: Theme.of(context).cardColor.withOpacity(0.2),
                child: const MultiLineContentPlaceholder(
                  lines: 6,
                ),
              ),
              // collections
              // TODO: not available in the api response

              /// description
              //const SizedBox(height: 8),
              // Text(
              //   item.description,
              //   style: Theme.of(context)
              //       .textTheme
              //       .titleMedium!
              //       .copyWith(fontWeight: FontWeight.w500),
              // ),
              //const SizedBox(height: 10),

              // Row(
              //   children: item.topics
              //       .asMap()
              //       .map(
              //         (k, v) => MapEntry(k, v.hash),
              //       )
              //       .values
              //       .toList()
              //       .map(
              //         (e) => Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text(
              //             '#$e',
              //             style: Theme.of(context)
              //                 .primaryTextTheme
              //                 .labelLarge
              //                 ?.copyWith(
              //                   color: AppColors.primaryDark,
              //                 ),
              //           ),
              //         ),
              //       )
              //       .toList(),
              // ),

              Container(
                width: 4,
                height: 4,
                margin: const EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
              const Row(
                children: [
                  // CircleAvatar(
                  //   radius: 16,
                  //   backgroundImage: CachedNetworkImageProvider(
                  //     item.author.imageUrl,
                  //   ),
                  // ),
                  SizedBox(width: 10),
                  // Text(
                  //   item.author.name,
                  //   style:
                  //       Theme.of(context).primaryTextTheme.labelLarge?.copyWith(
                  //             color: AppColors.primaryDark,
                  //           ),
                  // ),
                  SizedBox(width: 25),
                ],
              ),
              // Center(
              //   child: Container(
              //     alignment: Alignment.center,
              //     width: MediaQuery.of(context).size.width / 2,
              //     child: FilledButton(
              //       onPressed: () {},
              //        child: Text(
              //   'What you Think',
              //   style: Theme.of(context)
              //       .primaryTextTheme
              //       .labelLarge
              //       ?.copyWith(
              //         color: AppColors.onPrimaryTextColor,
              //       ),
              // ),
              //),
              // ),
              //),
              const SizedBox(height: 30),
              // Card(
              //   child: SvgPicture.asset(
              //     AppIcons.publisher,
              //     //color: Colors.black,
              //   ),
              // ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        // if (item.collection != null)
        //   Container(
        //     color: AppColors.secondary,
        //     padding: const EdgeInsets.symmetric(horizontal: 15),
        //     child: Column(
        //       children: [
        //         const SizedBox(height: 20),
        //         Row(
        //           children: [
        //             //const SizedBox(width: 18),
        //             Expanded(
        //               child: Text(
        //                 'Collection',
        //                 style: Theme.of(context).primaryTextTheme.titleLarge,
        //               ),
        //             ),
        //             Text(
        //               '3 Videos',
        //               style: Theme.of(context).primaryTextTheme.titleSmall,
        //             ),
        //           ],
        //         ),
        //         const SizedBox(height: 20),

        // collection list
        //       if (item.collection != null)
        //         Column(
        //           children: item.collection!
        //               .map(
        //                 (e) => Padding(
        //                   padding: const EdgeInsets.symmetric(
        //                     vertical: 10,
        //                   ),
        //                   child: GestureDetector(
        //                     onTap: () {
        //                       context.router.push(
        //                         PostDetailsRoute(slug: e.slug),
        //                       );
        //                     },
        //                     child: Container(
        //                       width: 354,
        //                       height: 100,
        //                       margin: const EdgeInsets.only(right: 18),
        //                       child: Row(
        //                         children: [
        //                           SizedBox(
        //                             height: 100,
        //                             width: 150,
        //                             child: Stack(
        //                               children: [
        //                                 OctoImage(
        //                                   width: 150,
        //                                   height: 100,
        //                                   image: CachedNetworkImageProvider(
        //                                     item.imageUrl,
        //                                   ),
        //                                   placeholderBuilder:
        //                                       OctoBlurHashFix.placeHolder(
        //                                     'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
        //                                     fit: BoxFit.cover,
        //                                   ),
        //                                   errorBuilder: OctoError.icon(
        //                                     color: Colors.red,
        //                                   ),
        //                                   fit: BoxFit.cover,
        //                                 ),
        //                                 // Icon
        //                                 Positioned(
        //                                   top: 12,
        //                                   left: 12,
        //                                   child: SvgPicture.asset(
        //                                     item.postType == PostType.video
        //                                         ? AppIcons.video
        //                                         : AppIcons.article,
        //                                     height: 20,
        //                                     color: Colors.white,
        //                                   ),
        //                                 ),
        //                                 // Duration
        //                                 Positioned(
        //                                   top: 12,
        //                                   right: 12,
        //                                   child: Text(
        //                                     item.duration
        //                                             ?.formatDurationFromSeconds() ??
        //                                         '',
        //                                     style: Theme.of(context)
        //                                         .primaryTextTheme
        //                                         .titleSmall
        //                                         ?.copyWith(
        //                                           color: Colors.white,
        //                                         ),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                           // details
        //                           const SizedBox(width: 15),
        //                           SizedBox(
        //                             width: MediaQuery.of(context).size.width /
        //                                 2.5,
        //                             height: 100,
        //                             child: Column(
        //                               children: [
        //                                 Flexible(
        //                                   child: Text(
        //                                     e.title,
        //                                     maxLines: 1,
        //                                     overflow: TextOverflow.ellipsis,
        //                                     style: Theme.of(context)
        //                                         .primaryTextTheme
        //                                         .labelLarge
        //                                         ?.copyWith(
        //                                           color:
        //                                               AppColors.primaryDark,
        //                                         ),
        //                                   ),
        //                                 ),
        //                                 const SizedBox(height: 8),
        //                                 Flexible(
        //                                   child: Container(
        //                                     child: Text(
        //                                       e.description,
        //                                       maxLines: 4,
        //                                       overflow: TextOverflow.ellipsis,
        //                                       style: Theme.of(context)
        //                                           .primaryTextTheme
        //                                           .titleSmall,
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               )
        //               .toList(),
        //         ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class PostDetailsWidgetHorizontalSkeleton extends StatelessWidget {
  const PostDetailsWidgetHorizontalSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class IconButtonSkeleton extends StatelessWidget {
  final String icon;
  const IconButtonSkeleton({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(bottom: 2, right: 4),
      alignment: Alignment.centerRight,
      highlightColor: Colors.transparent,
      onPressed: () {},
      icon: SvgPicture.asset(
        icon,
        height: 16,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
