import 'package:cloud_firestore/cloud_firestore.dart';

class Song {
  final String? id;
  final String? title;
  final String? artist;
  final String? song;
  final String? cover;
  final num? duration;
  final Timestamp? releaseDate;
  bool? isFavorite;

  Song({
    this.id,
    this.title,
    this.artist,
    this.song,
    this.cover,
    this.duration,
    this.releaseDate,
    this.isFavorite,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
    id: json['id'] as String?,
    title: json['title'] as String?,
    artist: json['artist'] as String?,
    song: json['song'] as String?,
    cover: json['cover'] as String?,
    duration: json['duration'] as num?,
    releaseDate: json['releaseDate'] as Timestamp?,
    isFavorite: json['isFavorite'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'artist': artist,
    'song': song,
    'cover': cover,
    'duration': duration,
    'releaseDate': releaseDate,
    'isFavorite': isFavorite,
  };
}
