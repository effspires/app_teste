const createTable = '''
  	CREATE TABLE contact(
      id INTEGER NOT NULL PRIMARY KEY
      , nome VARCHAR(200) NOT NULL
      , telefone CHAR(16) NOT NULL
      , email VARCHAR(150) NOT NULL
      , url_avatar VARCHAR(300) NOT NULL
    )
''';

const insert1 = '''
  INSERT INTO contact (nome, telefone, email, url_avatar)
  VALUES ('Fábio', '(55) 9 9159-5147', 'ef.fspires@gmail.com', 'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916__340.png')
''';

const insert2 = '''
  INSERT INTO contact (nome, telefone, email, url_avatar)
  VALUES ('Adriane Tim', '(55) 9 8115-5129', 'drimelara@gmail.com', 'https://cdn.pixabay.com/photo/2014/03/24/17/19/teacher-295387__340.png')
''';

const insert3 = '''
  INSERT INTO contact (nome, telefone, email, url_avatar)
  VALUES ('Adriane Claro', '(55) 9 9132-8971', 'drimelara@gmail.com', 'https://cdn.pixabay.com/photo/2014/03/24/17/19/teacher-295387__340.png')
''';