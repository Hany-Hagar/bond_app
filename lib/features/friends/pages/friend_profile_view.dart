// ignore_for_file: file_names

import 'package:flutter/material.dart';



class FriendProfileView extends StatelessWidget {
  const FriendProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildActionButtons(),
            const SizedBox(height: 20),
            _buildMediaSection(),
            const SizedBox(height: 20),
            _buildNotificationToggle(),
            const SizedBox(height: 20),
            _buildDestructiveActions(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // 1. Header with Background, Avatar, and Name
  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        // Green background curve/rect
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: Color(0xFF3E7B54), // Forest Green
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
          ),
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 50, left: 10),
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
            label: const Text("Back", style: TextStyle(color: Colors.white)),
          ),
        ),
        // Avatar and Text
        Positioned(
          top: 100,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/300'), // Placeholder
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "John Doe",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "john.doe@email.com",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 2. Audio, Video, Search Row
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _quickAction(Icons.phone_outlined, "Audio"),
          _quickAction(Icons.videocam_outlined, "Video"),
          _quickAction(Icons.search, "Search"),
        ],
      ),
    );
  }

  Widget _quickAction(IconData icon, String label) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // 3. Media, Links, Documents List
  Widget _buildMediaSection() {
    return _cardWrapper(
      child: Column(
        children: [
          _settingsTile(Icons.image_outlined, "Media", "Photos & Videos"),
          const Divider(height: 1),
          _settingsTile(Icons.link, "Links", "Shared links"),
          const Divider(height: 1),
          _settingsTile(Icons.description_outlined, "Documents", "Files & Documents"),
        ],
      ),
    );
  }

  // 4. Mute Notifications
  Widget _buildNotificationToggle() {
    return _cardWrapper(
      child: ListTile(
        leading: const Icon(Icons.notifications_none),
        title: const Text("Mute Notifications"),
        subtitle: const Text("Silence notifications for this chat"),
        trailing: Switch(
          value: true,
          onChanged: (val) {},
          activeColor: const Color(0xFF3E7B54),
        ),
      ),
    );
  }

  // 5. Destructive Actions (Red Section)
  Widget _buildDestructiveActions() {
    return _cardWrapper(
      borderColor: Colors.red.withOpacity(0.2),
      child: Column(
        children: [
          _settingsTile(Icons.block_flipped, "Clear Chat", "Delete all messages", color: Colors.red),
          const Divider(height: 1),
          _settingsTile(Icons.person_remove_outlined, "Unfriend", "Remove from friends list", color: Colors.red),
          const Divider(height: 1),
          _settingsTile(Icons. portrait_outlined, "Block User", "Block and remove friend", color: Colors.red),
        ],
      ),
    );
  }

  // Helper Widgets for Styling
  Widget _cardWrapper({required Widget child, Color? borderColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: borderColor != null ? Border.all(color: borderColor) : null,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)],
      ),
      child: child,
    );
  }

  Widget _settingsTile(IconData icon, String title, String subtitle, {Color color = Colors.black87}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: () {},
    );
  }
}

// class FriendProfileView extends StatelessWidget {
//   final ExploreModel friend;
//   const FriendProfileView({super.key, required this.friend });

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.sizeOf(context);

//     return BackGround(
//       body: CustomScrollView(
//         clipBehavior: Clip.none,
//         slivers: [
//           SliverPersistentHeader(
//             pinned: true,
//             delegate: _Top(expandedHeight: size.height * 0.25, friend: friend),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: FriendProfileBody(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _Top extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;
//   final ExploreModel friend;
//   _Top({required this.friend, required this.expandedHeight});

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     final double opacity = 1 - (shrinkOffset / expandedHeight).clamp(0.0, 1.0);
//     final double appearanceOpacity =
//         (shrinkOffset / (expandedHeight - minExtent)).clamp(0.0, 1.0);
//     return Stack(
//       clipBehavior: Clip.none,
//       fit: StackFit.expand,
//       children: [
//         Container(
//           color: Theme.of(context).scaffoldBackgroundColor,
//           child: Opacity(
//             opacity: opacity,
//             child: CachedNetworkImage(
//               fit: BoxFit.cover,
//               imageUrl: profileImageBaseUrl + (friend.profileImage),
//             ),
//           ),
//         ),
//         _TopAppBar(opacity: appearanceOpacity, friend: friend),
//         Positioned(
//           bottom: -120.h,
//           left: 0,
//           right: 0,
//           child: Opacity(
//             opacity: opacity,
//             child: Column(children: [_Image(friend: friend)]),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   double get maxExtent => expandedHeight;

//   @override
//   double get minExtent => kToolbarHeight + 35.h;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
//       true;
// }

// class _TopAppBar extends StatelessWidget {
//   final double opacity;
//   final FriendModel friend;
//   const _TopAppBar({required this.opacity, required this.friend});

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return PositionedDirectional(
//       start: 16.w,
//       top: MediaQuery.of(context).padding.top + 10.h,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: Icon(
//               size: 28.sp,
//               Icons.arrow_back_ios,
//               color: theme.hintColor,
//             ),
//           ),
//           SizedBox(width: 10.w),
//           Opacity(
//             opacity: opacity,
//             child: Row(
//               children: [
//                 CustomFriendImage(
//                   profileImage: friend.profileImage,
//                   radius: 28.r,
//                 ),
//                 SizedBox(width: 10.w),
//                 CustomText(
//                   text: friend.username,
//                   size: 26.sp,
//                   type: Type.overMedium,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _Image extends StatelessWidget {
//   final FriendModel friend;
//   const _Image({required this.friend});

//   @override
//   Widget build(BuildContext context) {
//     var text =
//         friend.firstName[0].toUpperCase() + friend.lastName[0].toUpperCase();
//     return Stack(
//       alignment: AlignmentDirectional.bottomEnd,
//       children: [
//         CustomFriendImage(profileImage: friend.profileImage, radius: 80.r),
//         CircleAvatar(
//           radius: 30.r,
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           child: CircleAvatar(
//             radius: 26.r,
//             backgroundColor: Theme.of(context).primaryColor,
//             child: CustomText(
//               text: text,
//               size: 24.sp,
//               color: Colors.white,
//               type: Type.overMedium,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
