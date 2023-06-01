// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import 'package:notr/src/utils/constants/strings.dart';

@Entity(tableName: notesTableName)
class Note extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  String? title;
  String? content;
  final int createdAt;
  int? editedAt;

  Note({
    this.id,
    this.title,
    this.content,
    required this.createdAt,
    this.editedAt,
  });

  Note copyWith({
    int? id,
    String? title,
    String? content,
    int? createdAt,
    int? editedAt,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      editedAt: editedAt ?? this.editedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'editedAt': editedAt,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      createdAt: map['createdAt'] as int,
      editedAt: map['editedAt'] != null ? map['editedAt'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      content,
      createdAt,
      editedAt,
    ];
  }
}
