import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/screens/doctor/profile/doctor_profile_screen.dart';
import 'package:zoner/screens/doctor/sessions/doctor_session_details_screen.dart';
import 'package:zoner/screens/doctor/sessions/doctor_sessions_screen.dart';
import 'package:zoner/screens/patient/cart/cart_screen.dart';
import 'package:zoner/screens/patient/cart/checkout_card_screen.dart';
import 'package:zoner/screens/patient/cart/checkout_failed_screen.dart';
import 'package:zoner/screens/patient/cart/checkout_mobile_money_screen.dart';
import 'package:zoner/screens/patient/cart/checkout_success_screen.dart';
import 'package:zoner/screens/patient/discover/find_doctors_screen.dart';
import 'package:zoner/screens/patient/discover/hospital_details_screen.dart';
import 'package:zoner/screens/patient/profile/medication_booklet_screen.dart';
import 'package:zoner/screens/patient/sessions/session_details_screen.dart';
import 'package:zoner/screens/patient/sessions/sessions_screen.dart';
import 'package:zoner/screens/shared/auth/loading_screen.dart';

import '../screens/doctor/bottom_nav_bar/doctor_bottom_nav_bar.dart';
import '../screens/patient/discover/discover_screen.dart';
import '../screens/patient/profile/patient_profile_screen.dart';
import '../screens/shared/auth/auth.dart';
import '../screens/shared/components_global/components.dart';
import '../screens/shared/home/home_screen.dart';
import '../screens/shared/messages/messages.dart';
import '../screens/shared/qr/scan_qr_screen.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    //initialLocation: "/${OnboardingScreen.id}",
    initialLocation: "/${DoctorBottomNavBar.id}",
    routes: <GoRoute>[
      ///------S H A R E D-------///
      // ----- Nav Bar ---- //
      GoRoute(
        path: "/",
        name: BottomNavBar.id,
        builder: (BuildContext context, GoRouterState state) =>
            const BottomNavBar(),
      ),
      GoRoute(
        path: "/${DoctorBottomNavBar.id}",
        name: DoctorBottomNavBar.id,
        builder: (BuildContext context, GoRouterState state) =>
            const DoctorBottomNavBar(),
      ),

      // ------- Messaging ----- //
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
      // ----- QR -------//
      GoRoute(
        path: "/${ScanQrScreen.id}",
        name: ScanQrScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const ScanQrScreen(),
      ),

      /// ------- Onboarding and Auth ----- ////
      GoRoute(
        path: "/${OnboardingScreen.id}",
        name: OnboardingScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const OnboardingScreen(),
        routes: <GoRoute>[
          //------ Auth-------//
          GoRoute(
            path: LoadingScreen.id,
            name: LoadingScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const LoadingScreen(),
          ),
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
                const DoctorVerificationScreen(),
          ),
        ],
      ),

      ///-------P A T I E N T   S E C T I O N--------///
      ///
      ///
      //------- Home -------//
      GoRoute(
        path: "/${HomeScreen.id}",
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
      //------Profile------//
      GoRoute(
          path: "/patient/${ProfileScreen.id}",
          name: ProfileScreen.id,
          builder: (BuildContext context, GoRouterState state) =>
              const ProfileScreen(),
          routes: <GoRoute>[
            GoRoute(
              path: MedicationBookletScreen.id,
              name: MedicationBookletScreen.id,
              builder: (BuildContext context, GoRouterState state) =>
                  const MedicationBookletScreen(),
            ),
          ]),

      ///-------D O C T O R   S E C T I O N--------///
      ///
      ///
      ///
      //------- Home -------//
      GoRoute(
        path: "/${HomeScreen.doctorId}",
        name: HomeScreen.doctorId,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(isDoctor: true),
      ),
      //------Sessions------//
      GoRoute(
        path: "/doctor/${DoctorSessionsScreen.id}",
        name: DoctorSessionsScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const DoctorSessionsScreen(),
        routes: <GoRoute>[
          GoRoute(
            path: DoctorSessionDetailsScreen.id,
            name: DoctorSessionDetailsScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const DoctorSessionDetailsScreen(),
          ),
        ],
      ),
      //------Profile------//
      GoRoute(
        path: "/doctor/${DoctorProfileScreen.id}",
        name: DoctorProfileScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const DoctorProfileScreen(),
      ),
    ],
  );
}
