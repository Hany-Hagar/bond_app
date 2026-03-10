import 'package:flutter/material.dart';
import 'package:ibond_application/core/features/friends/data/models/friend_model.dart';
import 'package:ibond_application/features/friends/widgets/friend_details_body.dart';

class FriendDetailView extends StatelessWidget {
  final FriendModel friend;
  const FriendDetailView({super.key, required this.friend});

  static const double expandedHeight = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: expandedHeight,
            pinned: true,
            backgroundColor: Colors.black,
            leading: const BackButton(),
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                final double currentHeight = constraints.biggest.height;

                /// scroll progress
                final double progress =
                    (currentHeight - kToolbarHeight) /
                    (expandedHeight - kToolbarHeight);

                final double clamped = progress.clamp(0.0, 1.0);

                final screenWidth = MediaQuery.of(context).size.width;

                /// start center
                final startX = 0.0;

                /// end near appbar leading
                final endX = -(screenWidth / 2) + 72;

                final avatarX = startX + (endX * (1 - clamped));

                final avatarY = (1 - clamped) * -60;

                final avatarScale = 0.5 + (clamped * 0.5);

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    /// background image
                    Image.network(
                      "https://i.pravatar.cc/600",
                      fit: BoxFit.cover,
                    ),

                    /// gradient
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black54],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),

                    /// avatar animation
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Transform.translate(
                        offset: Offset(avatarX, avatarY),
                        child: Transform.scale(
                          scale: avatarScale,
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage: NetworkImage(
                                "https://i.pravatar.cc/300",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          FriendDetailsBody(friend: friend),
        ],
      ),
    );
  }
}
