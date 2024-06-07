import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/screens/patient/discover/discover_screen.dart';
import 'package:zoner/screens/patient/discover/hospital_details_screen.dart';

import '../screens/auth/auth.dart';
import '../screens/auth/onboarding/onboarding.dart';
import '../screens/patient/home/home_screen.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: "/",
        name: HomeScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
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

      ///------ Discover-------///
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
        ],
      ),
    ],
  );
}
