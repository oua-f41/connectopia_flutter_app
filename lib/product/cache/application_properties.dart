import 'package:connectopia/product/constants/hive_constants.dart';
import 'package:hive/hive.dart';

part 'application_properties.g.dart';

@HiveType(typeId: HiveConstants.applicationPropertiesHiveId)
class ApplicationProperties {
  @HiveField(0)
  bool? isNewUser;

  @HiveField(1)
  bool? isDarkMode;

  @HiveField(2)
  String? locale;

  ApplicationProperties({this.isNewUser, this.isDarkMode, this.locale});

  ApplicationProperties copyWith({
    bool? isNewUser,
    bool? isDarkMode,
    String? locale,
  }) {
    return ApplicationProperties(
      isNewUser: isNewUser ?? this.isNewUser,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      locale: locale ?? this.locale,
    );
  }
}
