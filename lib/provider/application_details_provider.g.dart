// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$applicationHash() => r'2acfb15d6afe4d93556cf8a3d5201bbd88c7a15e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [application].
@ProviderFor(application)
const applicationProvider = ApplicationFamily();

/// See also [application].
class ApplicationFamily extends Family<AsyncValue<Application>> {
  /// See also [application].
  const ApplicationFamily();

  /// See also [application].
  ApplicationProvider call(
    int applicationId,
  ) {
    return ApplicationProvider(
      applicationId,
    );
  }

  @override
  ApplicationProvider getProviderOverride(
    covariant ApplicationProvider provider,
  ) {
    return call(
      provider.applicationId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'applicationProvider';
}

/// See also [application].
class ApplicationProvider extends AutoDisposeFutureProvider<Application> {
  /// See also [application].
  ApplicationProvider(
    int applicationId,
  ) : this._internal(
          (ref) => application(
            ref as ApplicationRef,
            applicationId,
          ),
          from: applicationProvider,
          name: r'applicationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$applicationHash,
          dependencies: ApplicationFamily._dependencies,
          allTransitiveDependencies:
              ApplicationFamily._allTransitiveDependencies,
          applicationId: applicationId,
        );

  ApplicationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.applicationId,
  }) : super.internal();

  final int applicationId;

  @override
  Override overrideWith(
    FutureOr<Application> Function(ApplicationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApplicationProvider._internal(
        (ref) => create(ref as ApplicationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        applicationId: applicationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Application> createElement() {
    return _ApplicationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationProvider && other.applicationId == applicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, applicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApplicationRef on AutoDisposeFutureProviderRef<Application> {
  /// The parameter `applicationId` of this provider.
  int get applicationId;
}

class _ApplicationProviderElement
    extends AutoDisposeFutureProviderElement<Application> with ApplicationRef {
  _ApplicationProviderElement(super.provider);

  @override
  int get applicationId => (origin as ApplicationProvider).applicationId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
