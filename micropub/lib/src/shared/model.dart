// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

dynamic jsonFromDateTime(DateTime? x) => x?.millisecondsSinceEpoch;
DateTime? jsonToDateTime(dynamic x) =>
    x is int ? DateTime.fromMillisecondsSinceEpoch(x) : null;

const jsonDateTime =
    JsonKey(fromJson: jsonToDateTime, toJson: jsonFromDateTime);

@Freezed()
class MicropubVersion with _$MicropubVersion {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  const factory MicropubVersion({
    required String version,
    required Map<String, dynamic> pubspec,
    String? pubspecYaml,
    String? uploader,
    String? readme,
    String? changelog,
    @jsonDateTime DateTime? createdAt,
  }) = _MicropubVersion;

  factory MicropubVersion.fromJson(Map<String, dynamic> map) =>
      _$MicropubVersionFromJson(map);
}

@Freezed()
class MicropubPackage with _$MicropubPackage {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  const factory MicropubPackage({
    required String name,
    required List<MicropubVersion> versions,
    List<String>? uploaders,
    int? download,
    @jsonDateTime DateTime? createdAt,
    @jsonDateTime DateTime? updatedAt,
  }) = _MicropubPackage;

  factory MicropubPackage.fromJson(Map<String, dynamic> map) =>
      _$MicropubPackageFromJson(map);
}

@Freezed()
class MicropubPackageDetails with _$MicropubPackageDetails {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  const factory MicropubPackageDetails({
    required MicropubPackage package,
  }) = _MicropubPackageDetails;

  factory MicropubPackageDetails.fromJson(Map<String, dynamic> map) =>
      _$MicropubPackageDetailsFromJson(map);
}

@Freezed()
class MicropubMe with _$MicropubMe {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  const factory MicropubMe({
    required String email,
    required List<MicropubAuthorization> authorizations,
  }) = _MicropubMe;

  factory MicropubMe.fromJson(Map<String, dynamic> map) =>
      _$MicropubMeFromJson(map);
}

@Freezed()
class MicropubQueryResult with _$MicropubQueryResult {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  const factory MicropubQueryResult({
    required int count,
    required List<MicropubPackage> packages,
  }) = _MicropubQueryResult;

  factory MicropubQueryResult.fromJson(Map<String, dynamic> map) =>
      _$MicropubQueryResultFromJson(map);
}

@Freezed()
class MicropubAccessKey with _$MicropubAccessKey {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  const factory MicropubAccessKey({
    required String id,
    required String key,
    required String email,
    required DateTime creationDate,
    required List<MicropubAuthorization> authorizations,
  }) = _MicropubAccessKey;

  factory MicropubAccessKey.fromJson(Map<String, dynamic> map) =>
      _$MicropubAccessKeyFromJson(map);
}

@Freezed()
class MicropubServerInfo with _$MicropubServerInfo {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  const factory MicropubServerInfo({
    String? name,
    required String adminEmail,
    required String distantHostUrl,
  }) = _MicropubServerInfo;

  factory MicropubServerInfo.fromJson(Map<String, dynamic> map) =>
      _$MicropubServerInfoFromJson(map);
}

enum MicropubAuthorization {
  // Can create access key
  admin,
  // Can read packages
  read,
  // Can update packages and versions
  write,
}

MicropubAuthorization micropubAuthorizationFromString(String value) =>
    _$MicropubAuthorizationEnumMap.entries
        .firstWhere((x) => x.value == value)
        .key;
