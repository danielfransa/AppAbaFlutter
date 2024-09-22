// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$applicationsHash() => r'bca55f23d6035aa90a892ddc6d3c25785214c8bf';

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

/// See also [applications].
@ProviderFor(applications)
const applicationsProvider = ApplicationsFamily();

/// See also [applications].
class ApplicationsFamily extends Family<AsyncValue<List<Application>>> {
  /// See also [applications].
  const ApplicationsFamily();

  /// See also [applications].
  ApplicationsProvider call(
    int protocolId,
  ) {
    return ApplicationsProvider(
      protocolId,
    );
  }

  @override
  ApplicationsProvider getProviderOverride(
    covariant ApplicationsProvider provider,
  ) {
    return call(
      provider.protocolId,
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
  String? get name => r'applicationsProvider';
}

/// See also [applications].
class ApplicationsProvider
    extends AutoDisposeFutureProvider<List<Application>> {
  /// See also [applications].
  ApplicationsProvider(
    int protocolId,
  ) : this._internal(
          (ref) => applications(
            ref as ApplicationsRef,
            protocolId,
          ),
          from: applicationsProvider,
          name: r'applicationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$applicationsHash,
          dependencies: ApplicationsFamily._dependencies,
          allTransitiveDependencies:
              ApplicationsFamily._allTransitiveDependencies,
          protocolId: protocolId,
        );

  ApplicationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.protocolId,
  }) : super.internal();

  final int protocolId;

  @override
  Override overrideWith(
    FutureOr<List<Application>> Function(ApplicationsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApplicationsProvider._internal(
        (ref) => create(ref as ApplicationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        protocolId: protocolId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Application>> createElement() {
    return _ApplicationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationsProvider && other.protocolId == protocolId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, protocolId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApplicationsRef on AutoDisposeFutureProviderRef<List<Application>> {
  /// The parameter `protocolId` of this provider.
  int get protocolId;
}

class _ApplicationsProviderElement
    extends AutoDisposeFutureProviderElement<List<Application>>
    with ApplicationsRef {
  _ApplicationsProviderElement(super.provider);

  @override
  int get protocolId => (origin as ApplicationsProvider).protocolId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
