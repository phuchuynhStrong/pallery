import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'program.g.dart';

@Collection(inheritance: false)
@CopyWith()
class MindfulnessProgram extends Equatable {
  MindfulnessProgram({
    this.id,
    this.name,
    this.iconCodePoint,
    this.fontFamily,
  });

  final Id? id;

  final String? name;
  final int? iconCodePoint;
  final String? fontFamily;

  @ignore
  @override
  List<Object?> get props => [id, name, iconCodePoint];
}
