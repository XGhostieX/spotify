import 'package:cloud_firestore/cloud_firestore.dart';

class Song {
  final String? title;
  final String? artist;
  final String? song;
  final String? cover;
  final num? duration;
  final Timestamp? releaseDate;

  const Song({
    this.title,
    this.artist,
    this.song,
    this.cover,
    this.duration,
    this.releaseDate,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
    title: json['title'] as String?,
    artist: json['artist'] as String?,
    song: json['song'] as String?,
    cover: json['cover'] as String?,
    duration: json['duration'] as num?,
    releaseDate: json['releaseDate'] as Timestamp?,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'artist': artist,
    'song': song,
    'cover': cover,
    'duration': duration,
    'releaseDate': releaseDate,
  };
}
