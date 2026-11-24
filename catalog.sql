PRAGMA foreign_keys = ON;

BEGIN;

CREATE TABLE titles (
  category TEXT NOT NULL CHECK (category IN ('Film', 'Anime')),
  chart_rank INTEGER NOT NULL CHECK (chart_rank > 0),
  title TEXT NOT NULL,
  alternate_title TEXT,
  release_year INTEGER NOT NULL,
  format TEXT NOT NULL,
  score REAL NOT NULL CHECK (score BETWEEN 0 AND 10),
  source_id TEXT NOT NULL,
  vietnamese_title TEXT,
  director TEXT,
  genre TEXT,
  release_date TEXT,
  runtime INTEGER CHECK (runtime > 0),
  status TEXT NOT NULL DEFAULT 'Available' CHECK (status IN ('Available', 'Coming soon', 'Archived')),
  PRIMARY KEY (category, chart_rank),
  UNIQUE (category, source_id)
);

INSERT INTO titles (category, chart_rank, title, alternate_title, release_year, format, score, source_id) VALUES
  ('Film', 1, 'The Shawshank Redemption', NULL, 1994, 'Feature film', 9.3, 'tt0111161'),
  ('Film', 2, 'The Godfather', NULL, 1972, 'Feature film', 9.2, 'tt0068646'),
  ('Film', 3, 'The Dark Knight', NULL, 2008, 'Feature film', 9.1, 'tt0468569'),
  ('Film', 4, 'The Godfather Part II', NULL, 1974, 'Feature film', 9.0, 'tt0071562'),
  ('Film', 5, 'The Lord of the Rings: The Return of the King', NULL, 2003, 'Feature film', 9.0, 'tt0167260'),
  ('Film', 6, '12 Angry Men', NULL, 1957, 'Feature film', 9.0, 'tt0050083'),
  ('Film', 7, 'Schindler''s List', NULL, 1993, 'Feature film', 9.0, 'tt0108052'),
  ('Film', 8, 'The Lord of the Rings: The Fellowship of the Ring', NULL, 2001, 'Feature film', 8.9, 'tt0120737'),
  ('Film', 9, 'Pulp Fiction', NULL, 1994, 'Feature film', 8.8, 'tt0110912'),
  ('Film', 10, 'The Lord of the Rings: The Two Towers', NULL, 2002, 'Feature film', 8.8, 'tt0167261'),
  ('Film', 11, 'The Good, the Bad and the Ugly', NULL, 1966, 'Feature film', 8.8, 'tt0060196'),
  ('Film', 12, 'Forrest Gump', NULL, 1994, 'Feature film', 8.8, 'tt0109830'),
  ('Film', 13, 'Inception', NULL, 2010, 'Feature film', 8.8, 'tt1375666'),
  ('Film', 14, 'Fight Club', NULL, 1999, 'Feature film', 8.8, 'tt0137523'),
  ('Film', 15, 'Star Wars: Episode V - The Empire Strikes Back', NULL, 1980, 'Feature film', 8.7, 'tt0080684'),
  ('Film', 16, 'The Matrix', NULL, 1999, 'Feature film', 8.7, 'tt0133093'),
  ('Film', 17, 'Interstellar', NULL, 2014, 'Feature film', 8.7, 'tt0816692'),
  ('Film', 18, 'GoodFellas', NULL, 1990, 'Feature film', 8.7, 'tt0099685'),
  ('Film', 19, 'One Flew Over the Cuckoo''s Nest', NULL, 1975, 'Feature film', 8.6, 'tt0073486'),
  ('Film', 20, 'Seven', 'Se7en', 1995, 'Feature film', 8.6, 'tt0114369'),
  ('Anime', 1, 'Frieren: Beyond Journey''s End', 'Sousou no Frieren', 2023, 'TV series', 9.24, '52991'),
  ('Anime', 2, 'Fullmetal Alchemist: Brotherhood', NULL, 2009, 'TV series', 9.11, '5114'),
  ('Anime', 3, 'Steins;Gate', NULL, 2011, 'TV series', 9.07, '9253'),
  ('Anime', 4, 'Attack on Titan Season 3 Part 2', 'Shingeki no Kyojin Season 3 Part 2', 2019, 'TV series', 9.06, '38524'),
  ('Anime', 5, 'Chainsaw Man – The Movie: Reze Arc', 'Chainsaw Man Movie: Reze-hen', 2025, 'Anime film', 9.05, '57555'),
  ('Anime', 6, 'Gintama: The Final', 'Gintama: The Very Final', 2021, 'Anime film', 9.05, '39486'),
  ('Anime', 7, 'Gintama°', NULL, 2015, 'TV series', 9.05, '28977'),
  ('Anime', 8, 'Re:ZERO -Starting Life in Another World- Season 4', 'Re:Zero kara Hajimeru Isekai Seikatsu 4th Season', 2026, 'TV series', 9.05, '61316'),
  ('Anime', 9, 'Hunter x Hunter (2011)', NULL, 2011, 'TV series', 9.03, '11061'),
  ('Anime', 10, 'Steel Ball Run: JoJo''s Bizarre Adventure', 'Steel Ball Run: JoJo no Kimyou na Bouken', 2026, 'Web series', 9.03, '61469'),
  ('Anime', 11, 'Legend of the Galactic Heroes', 'Ginga Eiyuu Densetsu', 1988, 'OVA', 9.02, '820'),
  ('Anime', 12, 'Gintama''', NULL, 2011, 'TV series', 9.02, '9969'),
  ('Anime', 13, 'Gintama'': Enchousen', NULL, 2012, 'TV series', 9.02, '15417'),
  ('Anime', 14, 'One Piece Fan Letter', NULL, 2024, 'TV special', 8.99, '60022'),
  ('Anime', 15, 'Gintama.', NULL, 2017, 'TV series', 8.98, '34096'),
  ('Anime', 16, 'Bleach: Thousand-Year Blood War', 'Bleach: Sennen Kessen-hen', 2022, 'TV series', 8.97, '41467'),
  ('Anime', 17, 'Kaguya-sama: Love Is War – Ultra Romantic', 'Kaguya-sama wa Kokurasetai: Ultra Romantic', 2022, 'TV series', 8.94, '43608'),
  ('Anime', 18, 'Clannad: After Story', NULL, 2008, 'TV series', 8.93, '4181'),
  ('Anime', 19, 'Gintama', NULL, 2006, 'TV series', 8.93, '918'),
  ('Anime', 20, 'A Silent Voice', 'Koe no Katachi', 2016, 'Anime film', 8.93, '28851');

WITH localized (source_id, name) AS (
  VALUES
    ('tt0111161', 'Nhà tù Shawshank'),
    ('tt0068646', 'Bố già'),
    ('tt0468569', 'Kỵ sĩ bóng đêm'),
    ('tt0071562', 'Bố già phần II'),
    ('tt0167260', 'Chúa tể những chiếc nhẫn: Sự trở về của nhà vua'),
    ('tt0050083', '12 người đàn ông giận dữ'),
    ('tt0108052', 'Bản danh sách của Schindler'),
    ('tt0120737', 'Chúa tể những chiếc nhẫn: Hiệp hội nhẫn thần'),
    ('tt0110912', 'Chuyện tầm phào'),
    ('tt0167261', 'Chúa tể những chiếc nhẫn: Hai tòa tháp'),
    ('tt0060196', 'Thiện, ác, tà'),
    ('tt0109830', 'Cuộc đời Forrest Gump'),
    ('tt1375666', 'Kẻ đánh cắp giấc mơ'),
    ('tt0137523', 'Sàn đấu sinh tử'),
    ('tt0080684', 'Chiến tranh giữa các vì sao: Tập V – Đế chế phản công'),
    ('tt0133093', 'Ma trận'),
    ('tt0816692', 'Hố đen tử thần'),
    ('tt0099685', 'Chiến hữu'),
    ('tt0073486', 'Bay trên tổ chim cúc cu'),
    ('tt0114369', 'Bảy tội lỗi'),
    ('52991', 'Frieren: Pháp sư tiễn táng'),
    ('5114', 'Giả kim thuật sư: Tình anh em'),
    ('9253', 'Steins;Gate: Cánh cổng thời gian'),
    ('38524', 'Đại chiến Titan: Mùa 3, phần 2'),
    ('57555', 'Chainsaw Man: Chương Reze'),
    ('39486', 'Gintama: Hồi kết'),
    ('28977', 'Gintama° (2015)'),
    ('61316', 'Re:Zero: Bắt đầu lại ở thế giới khác, mùa 4'),
    ('11061', 'Thợ săn x Thợ săn (2011)'),
    ('61469', 'Cuộc phiêu lưu kỳ bí của JoJo: Cuộc đua ngựa thép'),
    ('820', 'Huyền thoại các anh hùng ngân hà'),
    ('9969', 'Gintama: Phần tiếp nối (2011)'),
    ('15417', 'Gintama: Phần mở rộng (2012)'),
    ('60022', 'Đảo hải tặc: Lá thư của người hâm mộ'),
    ('34096', 'Gintama. (2017)'),
    ('41467', 'Bleach: Huyết chiến ngàn năm'),
    ('43608', 'Kaguya-sama: Cuộc chiến tỏ tình, mùa 3'),
    ('4181', 'Clannad: Câu chuyện tiếp theo'),
    ('918', 'Gintama (2006)'),
    ('28851', 'Dáng hình thanh âm')
)
UPDATE titles
SET vietnamese_title = (SELECT name FROM localized WHERE localized.source_id = titles.source_id);

WITH details (source_id, director, genre, release_date, runtime) AS (
  VALUES
    ('tt0111161', 'Frank Darabont', 'Drama', '1994-09-23', 142),
    ('tt0068646', 'Francis Ford Coppola', 'Crime', '1972-03-24', 175),
    ('tt0468569', 'Christopher Nolan', 'Action', '2008-07-18', 152),
    ('tt0071562', 'Francis Ford Coppola', 'Crime', '1974-12-20', 202),
    ('tt0167260', 'Peter Jackson', 'Fantasy', '2003-12-17', 201),
    ('tt0050083', 'Sidney Lumet', 'Drama', '1957-04-10', 96),
    ('tt0108052', 'Steven Spielberg', 'Drama', '1993-12-15', 196),
    ('tt0120737', 'Peter Jackson', 'Fantasy', '2001-12-19', 178),
    ('tt0110912', 'Quentin Tarantino', 'Crime', '1994-10-14', 154),
    ('tt0167261', 'Peter Jackson', 'Fantasy', '2002-12-18', 179),
    ('tt0060196', 'Sergio Leone', 'Western', '1966-12-23', 178),
    ('tt0109830', 'Robert Zemeckis', 'Drama', '1994-07-06', 142),
    ('tt1375666', 'Christopher Nolan', 'Sci-fi', '2010-07-16', 148),
    ('tt0137523', 'David Fincher', 'Drama', '1999-10-15', 139),
    ('tt0080684', 'Irvin Kershner', 'Sci-fi', '1980-05-21', 124),
    ('tt0133093', 'Lana and Lilly Wachowski', 'Sci-fi', '1999-03-31', 136),
    ('tt0816692', 'Christopher Nolan', 'Sci-fi', '2014-11-07', 169),
    ('tt0099685', 'Martin Scorsese', 'Crime', '1990-09-19', 145),
    ('tt0073486', 'Miloš Forman', 'Drama', '1975-11-19', 133),
    ('tt0114369', 'David Fincher', 'Thriller', '1995-09-22', 127),
    ('52991', 'Keiichirō Saitō', 'Fantasy', '2023-09-29', NULL),
    ('5114', 'Yasuhiro Irie', 'Fantasy', '2009-04-05', NULL),
    ('9253', 'Hiroshi Hamasaki, Takuya Satō', 'Sci-fi', '2011-04-06', NULL),
    ('38524', 'Tetsurō Araki, Masashi Koizuka', 'Action', '2019-04-29', NULL),
    ('57555', 'Tatsuya Yoshihara', 'Action', '2025-09-19', 100),
    ('39486', 'Chizuru Miyawaki', 'Comedy', '2021-01-08', 104),
    ('28977', 'Chizuru Miyawaki', 'Comedy', '2015-04-08', NULL),
    ('61316', 'Masahiro Shinohara', 'Fantasy', NULL, NULL),
    ('11061', 'Hiroshi Kōjina', 'Adventure', '2011-10-02', NULL),
    ('61469', NULL, 'Adventure', NULL, NULL),
    ('820', 'Noboru Ishiguro', 'Sci-fi', NULL, NULL),
    ('9969', 'Yōichi Fujita', 'Comedy', '2011-04-04', NULL),
    ('15417', 'Yōichi Fujita', 'Comedy', '2012-10-04', NULL),
    ('60022', 'Megumi Ishitani', 'Adventure', '2024-10-20', 25),
    ('34096', 'Chizuru Miyawaki', 'Comedy', '2017-01-09', NULL),
    ('41467', 'Tomohisa Taguchi', 'Action', '2022-10-11', NULL),
    ('43608', 'Mamoru Hatakeyama', 'Romance', '2022-04-09', NULL),
    ('4181', 'Tatsuya Ishihara', 'Drama', '2008-10-03', NULL),
    ('918', 'Shinji Takamatsu, Yōichi Fujita', 'Comedy', '2006-04-04', NULL),
    ('28851', 'Naoko Yamada', 'Drama', '2016-09-17', 130)
)
UPDATE titles
SET (director, genre, release_date, runtime) = (
  SELECT director, genre, release_date, runtime
  FROM details
  WHERE details.source_id = titles.source_id
);

CREATE TABLE members (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL COLLATE NOCASE UNIQUE,
  plan TEXT NOT NULL CHECK (plan IN ('Free', 'Monthly', 'Annual')),
  joined_on TEXT NOT NULL
);

CREATE TABLE watch_history (
  id TEXT PRIMARY KEY,
  category TEXT NOT NULL,
  source_id TEXT NOT NULL,
  member_id TEXT NOT NULL REFERENCES members(id) ON DELETE RESTRICT,
  watched_on TEXT NOT NULL,
  minutes INTEGER NOT NULL CHECK (minutes > 0),
  FOREIGN KEY (category, source_id) REFERENCES titles(category, source_id) ON DELETE RESTRICT
);

INSERT INTO members VALUES
  ('m1', 'Alex Rivera', 'alex@example.com', 'Monthly', date('now', '-45 days')),
  ('m2', 'Jamie Chen', 'jamie@example.com', 'Annual', date('now', '-30 days')),
  ('m3', 'Morgan Lee', 'morgan@example.com', 'Free', date('now', '-15 days')),
  ('m4', 'Sam Patel', 'sam@example.com', 'Monthly', date('now', '-8 days')),
  ('m5', 'Taylor Nguyen', 'taylor@example.com', 'Free', date('now', '-6 days'));

INSERT INTO watch_history VALUES
  ('w1', 'Film', 'tt0111161', 'm1', date('now', '-6 days'), 142),
  ('w2', 'Anime', '52991', 'm2', date('now', '-5 days'), 24),
  ('w3', 'Anime', '5114', 'm2', date('now', '-3 days'), 24),
  ('w4', 'Film', 'tt0468569', 'm3', date('now', '-3 days'), 92),
  ('w5', 'Anime', '52991', 'm4', date('now', '-2 days'), 24),
  ('w6', 'Film', 'tt0816692', 'm1', date('now', '-1 day'), 169),
  ('w7', 'Anime', '9253', 'm5', date('now'), 24),
  ('w8', 'Anime', '52991', 'm2', date('now'), 24);

COMMIT;
