// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_module.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class NewsTableData extends DataClass implements Insertable<NewsTableData> {
  final String url;
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final bool isBookmarked;
  NewsTableData(
      {@required this.url,
      @required this.author,
      @required this.title,
      @required this.description,
      @required this.urlToImage,
      @required this.publishedAt,
      @required this.content,
      @required this.isBookmarked});
  factory NewsTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return NewsTableData(
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
      author:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}author']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      urlToImage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}url_to_image']),
      publishedAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}published_at']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      isBookmarked: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_bookmarked']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || urlToImage != null) {
      map['url_to_image'] = Variable<String>(urlToImage);
    }
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<String>(publishedAt);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || isBookmarked != null) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked);
    }
    return map;
  }

  NewsTableCompanion toCompanion(bool nullToAbsent) {
    return NewsTableCompanion(
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      urlToImage: urlToImage == null && nullToAbsent
          ? const Value.absent()
          : Value(urlToImage),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      isBookmarked: isBookmarked == null && nullToAbsent
          ? const Value.absent()
          : Value(isBookmarked),
    );
  }

  factory NewsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NewsTableData(
      url: serializer.fromJson<String>(json['url']),
      author: serializer.fromJson<String>(json['author']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      urlToImage: serializer.fromJson<String>(json['urlToImage']),
      publishedAt: serializer.fromJson<String>(json['publishedAt']),
      content: serializer.fromJson<String>(json['content']),
      isBookmarked: serializer.fromJson<bool>(json['isBookmarked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'url': serializer.toJson<String>(url),
      'author': serializer.toJson<String>(author),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'urlToImage': serializer.toJson<String>(urlToImage),
      'publishedAt': serializer.toJson<String>(publishedAt),
      'content': serializer.toJson<String>(content),
      'isBookmarked': serializer.toJson<bool>(isBookmarked),
    };
  }

  NewsTableData copyWith(
          {String url,
          String author,
          String title,
          String description,
          String urlToImage,
          String publishedAt,
          String content,
          bool isBookmarked}) =>
      NewsTableData(
        url: url ?? this.url,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content,
        isBookmarked: isBookmarked ?? this.isBookmarked,
      );
  @override
  String toString() {
    return (StringBuffer('NewsTableData(')
          ..write('url: $url, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content, ')
          ..write('isBookmarked: $isBookmarked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      url.hashCode,
      $mrjc(
          author.hashCode,
          $mrjc(
              title.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(
                      urlToImage.hashCode,
                      $mrjc(publishedAt.hashCode,
                          $mrjc(content.hashCode, isBookmarked.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NewsTableData &&
          other.url == this.url &&
          other.author == this.author &&
          other.title == this.title &&
          other.description == this.description &&
          other.urlToImage == this.urlToImage &&
          other.publishedAt == this.publishedAt &&
          other.content == this.content &&
          other.isBookmarked == this.isBookmarked);
}

class NewsTableCompanion extends UpdateCompanion<NewsTableData> {
  final Value<String> url;
  final Value<String> author;
  final Value<String> title;
  final Value<String> description;
  final Value<String> urlToImage;
  final Value<String> publishedAt;
  final Value<String> content;
  final Value<bool> isBookmarked;
  const NewsTableCompanion({
    this.url = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.content = const Value.absent(),
    this.isBookmarked = const Value.absent(),
  });
  NewsTableCompanion.insert({
    @required String url,
    @required String author,
    @required String title,
    @required String description,
    @required String urlToImage,
    @required String publishedAt,
    @required String content,
    @required bool isBookmarked,
  })  : url = Value(url),
        author = Value(author),
        title = Value(title),
        description = Value(description),
        urlToImage = Value(urlToImage),
        publishedAt = Value(publishedAt),
        content = Value(content),
        isBookmarked = Value(isBookmarked);
  static Insertable<NewsTableData> custom({
    Expression<String> url,
    Expression<String> author,
    Expression<String> title,
    Expression<String> description,
    Expression<String> urlToImage,
    Expression<String> publishedAt,
    Expression<String> content,
    Expression<bool> isBookmarked,
  }) {
    return RawValuesInsertable({
      if (url != null) 'url': url,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (publishedAt != null) 'published_at': publishedAt,
      if (content != null) 'content': content,
      if (isBookmarked != null) 'is_bookmarked': isBookmarked,
    });
  }

  NewsTableCompanion copyWith(
      {Value<String> url,
      Value<String> author,
      Value<String> title,
      Value<String> description,
      Value<String> urlToImage,
      Value<String> publishedAt,
      Value<String> content,
      Value<bool> isBookmarked}) {
    return NewsTableCompanion(
      url: url ?? this.url,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<String>(publishedAt.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (isBookmarked.present) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsTableCompanion(')
          ..write('url: $url, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content, ')
          ..write('isBookmarked: $isBookmarked')
          ..write(')'))
        .toString();
  }
}

class $NewsTableTable extends NewsTable
    with TableInfo<$NewsTableTable, NewsTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $NewsTableTable(this._db, [this._alias]);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _authorMeta = const VerificationMeta('author');
  GeneratedTextColumn _author;
  @override
  GeneratedTextColumn get author => _author ??= _constructAuthor();
  GeneratedTextColumn _constructAuthor() {
    return GeneratedTextColumn(
      'author',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlToImageMeta = const VerificationMeta('urlToImage');
  GeneratedTextColumn _urlToImage;
  @override
  GeneratedTextColumn get urlToImage => _urlToImage ??= _constructUrlToImage();
  GeneratedTextColumn _constructUrlToImage() {
    return GeneratedTextColumn(
      'url_to_image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  GeneratedTextColumn _publishedAt;
  @override
  GeneratedTextColumn get publishedAt =>
      _publishedAt ??= _constructPublishedAt();
  GeneratedTextColumn _constructPublishedAt() {
    return GeneratedTextColumn(
      'published_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isBookmarkedMeta =
      const VerificationMeta('isBookmarked');
  GeneratedBoolColumn _isBookmarked;
  @override
  GeneratedBoolColumn get isBookmarked =>
      _isBookmarked ??= _constructIsBookmarked();
  GeneratedBoolColumn _constructIsBookmarked() {
    return GeneratedBoolColumn(
      'is_bookmarked',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        url,
        author,
        title,
        description,
        urlToImage,
        publishedAt,
        content,
        isBookmarked
      ];
  @override
  $NewsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'news_table';
  @override
  final String actualTableName = 'news_table';
  @override
  VerificationContext validateIntegrity(Insertable<NewsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url'], _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author'], _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image'], _urlToImageMeta));
    } else if (isInserting) {
      context.missing(_urlToImageMeta);
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at'], _publishedAtMeta));
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content'], _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('is_bookmarked')) {
      context.handle(
          _isBookmarkedMeta,
          isBookmarked.isAcceptableOrUnknown(
              data['is_bookmarked'], _isBookmarkedMeta));
    } else if (isInserting) {
      context.missing(_isBookmarkedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {url};
  @override
  NewsTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NewsTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $NewsTableTable createAlias(String alias) {
    return $NewsTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $NewsTableTable _newsTable;
  $NewsTableTable get newsTable => _newsTable ??= $NewsTableTable(this);
  DetailNewsDao _detailNewsDao;
  DetailNewsDao get detailNewsDao =>
      _detailNewsDao ??= DetailNewsDao(this as AppDatabase);
  BookmarkDao _bookmarkDao;
  BookmarkDao get bookmarkDao =>
      _bookmarkDao ??= BookmarkDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [newsTable];
}
