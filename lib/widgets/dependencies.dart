import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:tailor_made/coordinator/contacts_coordinator.dart';
import 'package:tailor_made/coordinator/gallery_coordinator.dart';
import 'package:tailor_made/coordinator/jobs_coordinator.dart';
import 'package:tailor_made/coordinator/measures_coordinator.dart';
import 'package:tailor_made/coordinator/payments_coordinator.dart';
import 'package:tailor_made/coordinator/shared_coordinator.dart';
import 'package:tailor_made/coordinator/splash_coordinator.dart';
import 'package:tailor_made/coordinator/tasks_coordinator.dart';
import 'package:tailor_made/repository/main.dart';
import 'package:tailor_made/services/accounts/main.dart';
import 'package:tailor_made/services/contacts/main.dart';
import 'package:tailor_made/services/gallery/main.dart';
import 'package:tailor_made/services/jobs/main.dart';
import 'package:tailor_made/services/measures/main.dart';
import 'package:tailor_made/services/payments/main.dart';
import 'package:tailor_made/services/session.dart';
import 'package:tailor_made/services/settings/main.dart';
import 'package:tailor_made/services/stats/main.dart';

class Dependencies {
  Dependencies(Session session, GlobalKey<NavigatorState> navigatorKey, Repository repository)
      : assert(session != null && navigatorKey != null && repository != null) {
    Injector.appInstance
      ..registerSingleton<Dependencies>((_) => this)
      ..registerSingleton<Repository>((_) => repository)
      ..registerSingleton<Session>((_) => session)
      ..registerSingleton<Accounts>((_) => session.isMock ? AccountsMockImpl() : AccountsImpl())
      ..registerSingleton<Contacts>((_) => session.isMock ? ContactsMockImpl() : ContactsImpl())
      ..registerSingleton<Jobs>((_) => session.isMock ? JobsMockImpl() : JobsImpl())
      ..registerSingleton<Gallery>((_) => session.isMock ? GalleryMockImpl() : GalleryImpl())
      ..registerSingleton<Settings>((_) => session.isMock ? SettingsMockImpl() : SettingsImpl())
      ..registerSingleton<Payments>((_) => session.isMock ? PaymentsMockImpl() : PaymentsImpl())
      ..registerSingleton<Measures>((_) => session.isMock ? MeasuresMockImpl() : MeasuresImpl())
      ..registerSingleton<Stats>((_) => session.isMock ? StatsMockImpl() : StatsImpl())
      ..registerSingleton<ContactsCoordinator>((_) => ContactsCoordinator(navigatorKey))
      ..registerSingleton<GalleryCoordinator>((_) => GalleryCoordinator(navigatorKey))
      ..registerSingleton<SharedCoordinator>((_) => SharedCoordinator(navigatorKey))
      ..registerSingleton<JobsCoordinator>((_) => JobsCoordinator(navigatorKey))
      ..registerSingleton<MeasuresCoordinator>((_) => MeasuresCoordinator(navigatorKey))
      ..registerSingleton<PaymentsCoordinator>((_) => PaymentsCoordinator(navigatorKey))
      ..registerSingleton<SplashCoordinator>((_) => SplashCoordinator(navigatorKey))
      ..registerSingleton<TasksCoordinator>((_) => TasksCoordinator(navigatorKey));
  }

  static Dependencies di() => Injector.appInstance.getDependency<Dependencies>();

  Repository get repository => Injector.appInstance.getDependency<Repository>();

  Session get session => Injector.appInstance.getDependency<Session>();

  Accounts get accounts => Injector.appInstance.getDependency<Accounts>();

  Contacts get contacts => Injector.appInstance.getDependency<Contacts>();

  Jobs get jobs => Injector.appInstance.getDependency<Jobs>();

  Gallery get gallery => Injector.appInstance.getDependency<Gallery>();

  Settings get settings => Injector.appInstance.getDependency<Settings>();

  Payments get payments => Injector.appInstance.getDependency<Payments>();

  Measures get measures => Injector.appInstance.getDependency<Measures>();

  Stats get stats => Injector.appInstance.getDependency<Stats>();

  ContactsCoordinator get contactsCoordinator => Injector.appInstance.getDependency<ContactsCoordinator>();

  GalleryCoordinator get galleryCoordinator => Injector.appInstance.getDependency<GalleryCoordinator>();

  SharedCoordinator get sharedCoordinator => Injector.appInstance.getDependency<SharedCoordinator>();

  JobsCoordinator get jobsCoordinator => Injector.appInstance.getDependency<JobsCoordinator>();

  MeasuresCoordinator get measuresCoordinator => Injector.appInstance.getDependency<MeasuresCoordinator>();

  PaymentsCoordinator get paymentsCoordinator => Injector.appInstance.getDependency<PaymentsCoordinator>();

  SplashCoordinator get splashCoordinator => Injector.appInstance.getDependency<SplashCoordinator>();

  TasksCoordinator get tasksCoordinator => Injector.appInstance.getDependency<TasksCoordinator>();
}
