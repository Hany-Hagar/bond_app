// Api Functions
const String baseUrl = 'https://back.ibond.ai/v1/';
const String profileImageBaseUrl = "https://back.ibond.ai/uploads/profiles/";

// Api Auth Endpoints
const String autoSignInUrl = 'users/me';
const String loginUrl = 'users/login';
const String registerUrl = 'users/register';
const String uploadProfileImageUrl = 'users/me/profile-image';
const String completeInfoUrl = 'users/me';
const String deleteAccountUrl = 'users/me';

// Api Profile Endpoints
const String updateProfile = 'users/me';
const String getProfile = 'users/me';

// Api Explore Friends Endpoints
const String searchFriendsUrl = 'friendships/search';
const String exploreFriendsUrl = 'users/search/mutual-friends';
const String sendFriendRequestUrl = 'friendships/requests';
const String cancelFriendRequestUrl = 'friendships/requests/cancel';

// Api Friend Requests Endpoints
const String getFriendRequestsUrl = 'friendships/requests';
const String acceptFriendRequestUrl = 'friendships/requests/accept';
const String declineFriendRequestUrl = 'friendships/requests/decline';
// Api Friends Endpoints
const String getFriendsUrl = 'friendships';

// Api Chat Endpoints
const String getChatsUrl = 'chats/conversations';

// Api Response Keys
const String data = 'data';
const String message = 'message';

// User Model Keys
const String id = 'id';
const String firstName = 'firstName';
const String lastName = 'lastName';
const String username = 'username';
const String bio = 'bio';
const String email = 'email';
const String password = 'password';
const String verificationToken = 'verificationToken';
const String resetPasswordToken = 'resetPasswordToken';
const String isAcountVerified = 'isAcountVerified';
const String profileImage = 'profileImage';
const String createdAt = 'createdAt';
const String updatedAt = 'updatedAt';