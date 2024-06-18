import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/screens/patient/cart/cart_screen.dart';
import 'package:zoner/screens/patient/cart/checkout_card_screen.dart';
import 'package:zoner/screens/patient/cart/checkout_failed_screen.dart';
import 'package:zoner/screens/patient/cart/checkout_mobile_money_screen.dart';
import 'package:zoner/screens/patient/cart/checkout_success_screen.dart';
import 'package:zoner/screens/patient/discover/discover_screen.dart';
import 'package:zoner/screens/patient/discover/doctor_profile_screen.dart';
import 'package:zoner/screens/patient/discover/find_doctors_screen.dart';
import 'package:zoner/screens/patient/discover/hospital_details_screen.dart';
import 'package:zoner/screens/patient/discover/qr_result_profile.dart';
import 'package:zoner/screens/patient/discover/scan_qr_screen.dart';
import 'package:zoner/screens/patient/sessions/session_details_screen.dart';
import 'package:zoner/screens/patient/sessions/sessions_screen.dart';

import '../screens/components_global/bottom_nav_bar.dart';
import '../screens/patient/home/home_screen.dart';
import '../screens/shared/auth/auth.dart';
import '../screens/shared/messages/messages.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: "/${OnboardingScreen.id}",
    routes: <GoRoute>[
      /// ----- Nav Bar ---- ///
      GoRoute(
        path: "/",
        name: BottomNavBar.id,
        builder: (BuildContext context, GoRouterState state) =>
            const BottomNavBar(),
      ),

      /// ------- Messaging ----- ////
      GoRoute(
        path: "/${MessagesScreen.id}",
        name: MessagesScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const OnboardingScreen(),
        routes: <GoRoute>[
          //------ Auth-------//
          GoRoute(
              path: AudioCallScreen.id,
              name: AudioCallScreen.id,
              builder: (BuildContext context, GoRouterState state) =>
                  const AudioCallScreen()),
          GoRoute(
              path: VideoCallScreen.id,
              name: VideoCallScreen.id,
              builder: (BuildContext context, GoRouterState state) =>
                  const VideoCallScreen()),
          GoRoute(
              path: ChatScreen.id,
              name: ChatScreen.id,
              builder: (BuildContext context, GoRouterState state) =>
                  const ChatScreen()),
        ],
      ),

      ///------Onboarding and Auth-------///
      GoRoute(
        path: "/${OnboardingScreen.id}",
        name: OnboardingScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const OnboardingScreen(),
        routes: <GoRoute>[
          //------ Auth-------//
          GoRoute(
            path: SignInScreen.id,
            name: SignInScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const SignInScreen(),
          ),
          GoRoute(
            path: RegisterScreen.id,
            name: RegisterScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const RegisterScreen(),
          ),
          GoRoute(
            path: BasicInfoScreen.id,
            name: BasicInfoScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const BasicInfoScreen(),
          ),
          GoRoute(
            path: DoctorPatientSelectorScreen.id,
            name: DoctorPatientSelectorScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const DoctorPatientSelectorScreen(),
          ),
          GoRoute(
            path: "patient/${HealthInfoScreen.id}",
            name: HealthInfoScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const HealthInfoScreen(),
          ),
          GoRoute(
            path: "doctor/${DocumentsSubmittedScreen.id}",
            name: DocumentsSubmittedScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const DocumentsSubmittedScreen(),
          ),
          GoRoute(
              path: "doctor/${DoctorVerificationScreen.id}",
              name: DoctorVerificationScreen.id,
              builder: (BuildContext context, GoRouterState state) =>
                  const DoctorVerificationScreen()),
        ],
      ),

      ///-------Patient Section--------///

      //------- Home -------//
      GoRoute(
        path: "/patient/${HomeScreen.id}",
        name: HomeScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),
      //------ Discover-------//
      GoRoute(
        path: "/patient/${DiscoverScreen.id}",
        name: DiscoverScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const DiscoverScreen(),
        routes: <GoRoute>[
          //------ Auth-------//
          GoRoute(
            path: HospitalDetailsScreen.id,
            name: HospitalDetailsScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const HospitalDetailsScreen(),
          ),
          GoRoute(
            path: FindDoctorsScreen.id,
            name: FindDoctorsScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const FindDoctorsScreen(),
          ),
          GoRoute(
            path: DoctorProfileScreen.id,
            name: DoctorProfileScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const DoctorProfileScreen(),
          ),
          GoRoute(
            path: QrResultProfile.id,
            name: QrResultProfile.id,
            builder: (BuildContext context, GoRouterState state) =>
                const QrResultProfile(),
          ),
          GoRoute(
            path: ScanQrScreen.id,
            name: ScanQrScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const ScanQrScreen(),
          ),
        ],
      ),

      //------Sessions------//
      GoRoute(
        path: "/patient/${SessionsScreen.id}",
        name: SessionsScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const SessionsScreen(),
        routes: <GoRoute>[
          //------ Auth-------//
          GoRoute(
            path: SessionDetailsScreen.id,
            name: SessionDetailsScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const SessionDetailsScreen(),
          ),
        ],
      ),

      //------Cart------//
      GoRoute(
        path: "/patient/${CartScreen.id}",
        name: CartScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const CartScreen(),
        routes: <GoRoute>[
          GoRoute(
            path: CheckoutCardScreen.id,
            name: CheckoutCardScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const CheckoutCardScreen(),
          ),
          GoRoute(
            path: CheckoutMobileMoneyScreen.id,
            name: CheckoutMobileMoneyScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const CheckoutMobileMoneyScreen(),
          ),
          GoRoute(
            path: CheckoutSuccessScreen.id,
            name: CheckoutSuccessScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const CheckoutSuccessScreen(),
          ),
          GoRoute(
            path: CheckoutFailedScreen.id,
            name: CheckoutFailedScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const CheckoutFailedScreen(),
          ),
        ],
      ),
    ],
  );
}
