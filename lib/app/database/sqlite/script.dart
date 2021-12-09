const createTable = '''
  	CREATE TABLE usuarios(
      id INTEGER NOT NULL PRIMARY KEY
      , nome VARCHAR(200) NOT NULL
      , telefone CHAR(16) NOT NULL
      , email VARCHAR(150) NOT NULL
      , senha VARCHAR(255) NOT NULL
      , avatar VARCHAR(300) NOT NULL
    )
''';

const insert1 = '''
  INSERT INTO usuarios (nome, telefone, email, senha, avatar)
  VALUES ('Fábio', '(55) 9 9159-5147', 'ef.fspires@gmail.com', '123456','assets/assets/avatar.png')
''';

const insert2 = '''
  INSERT INTO usuarios (nome, telefone, email, senha, avatar)
  VALUES ('Adriane Tim', '(55) 9 8115-5129', 'drimelara@gmail.com', '123456','assets/assets/avatar.png')
''';

const insert3 = '''
  INSERT INTO usuarios (nome, telefone, email, senha, avatar)
  VALUES ('João', '(54) 9 5152-8296', 'joaozelinda@gmail.com', '123456', 'assets/assets/avatar.png')
''';