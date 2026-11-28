import 'package:json_annotation/json_annotation.dart';

part 'education.g.dart';

/// Portfolio education entry synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Education {
  const Education({
    required this.institution,
    required this.degree,
    required this.startYear,
    this.endYear,
    this.description = '',
    this.id,
    this.starCount = 0,
    this.isStarred = false,
    this.starredByNames = '',
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String institution;
  final String degree;
  final int startYear;
  final int? endYear;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(includeToJson: false, defaultValue: 0)
  final int starCount;
  @JsonKey(includeToJson: false, defaultValue: false)
  final bool isStarred;
  @JsonKey(includeToJson: false, defaultValue: '')
  final String starredByNames;

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
