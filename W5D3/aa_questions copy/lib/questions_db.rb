
require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database

  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end


class User
  
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map {|datum| User.new(datum)}
  end

  def self.find_by_id(target_id)
    data = QuestionsDatabase.instance.execute(<<-SQL,target_id)
            SELECT
              *
            FROM
              users
            WHERE
              id = ?
    SQL
    User.new(data)
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
              *
            FROM
              users
            WHERE
              fname = ? AND lname = ?
    SQL
    User.new(data)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users
      VALUES
        (?, ?)  
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} is not in database" if !@id
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?,
        lname = ?
      WHERE
        id = ?
    SQL
  end

  def authored_questions
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = @id
      SQL
    data.map {|datum| Question.new(datum)}
  end

  def authored_replies
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        replies
      WHERE
        user_reference_id = @id
    SQL
    data.map {|datum| Reply.new(datum)}
  end

end

class Question


  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map {|datum| Question.new(datum)}
  end

  def self.find_by_id(target_id)
    data = QuestionsDatabase.instance.execute(<<-SQL,target_id)
            SELECT
              *
            FROM
              questions
            WHERE
              id = ?
    SQL
    Question.new(data)
  end

  def self.find_by_title(title)
    data = QuestionsDatabase.instance.execute(<<-SQL, title)
            SELECT
              *
            FROM
              questions
            WHERE
              title = ?
    SQL
    Question.new(data)
  end

  def self.find_by_author(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
              *
            FROM
              questions
            WHERE
              author_id = (
                            SELECT
                              id
                            FROM
                              users
                            WHERE
                              fname = ?
                              AND lname = ?
              )
    SQL
    Question.new(data)
  end

  attr_accessor :id, :title, :body, :author_id
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id)
      INSERT INTO
        questions
      VALUES
        (?, ?, ?)  
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} is not in database" if !@id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id, @id)
      UPDATE
        questions
      SET
        title = ?,
        body = ?,
        author_id = ?
      WHERE
        id = ?
    SQL
  end

  def author
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        users
      WHERE
        id = @author_id
    SQL
    data.map {|datum| User.new(datum)}
  end

  def replies
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        replies
      WHERE
        question_reference_id = @id
    SQL
    data.map {|datum| Reply.new(datum)}
  end

end



class QuestionsFollows

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        *
      FROM
        users
      JOIN
        questions_follows ON users.id = questions_follows.follower_id
      WHERE
        questions_follows.question_id = ?
    SQL
    data.map {|datum| User.new(datum)}
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions_follows")
    data.map {|datum| Question.new(datum)}
  end

  def self.find_by_id(target_id)
    data = QuestionsDatabase.instance.execute(<<-SQL,target_id)
            SELECT
              *
            FROM
              questions_follows
            WHERE
              id = ?
    SQL
    QuestionsFollows.new(data)
  end

  def self.find_by_follower_id(follower_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, follower_id)
            SELECT
              *
            FROM
              questions_follows
            WHERE
              follower_id = ?
    SQL
    QuestionsFollows.new(data)
  end

  def self.find_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
              *
            FROM
              questions_follows
            WHERE
              question_id = ?
    SQL
    QuestionsFollows.new(data)
  end

  attr_accessor :id, :follower_id, :question_id
  def initialize(options)
    @id = options['id']
    @follower_id = options['follower_id']
    @question_id = options['question_id']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @follower_id, @question_id)
      INSERT INTO
        questions_follows
      VALUES
        (?, ?)  
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} is not in database" if !@id
    QuestionsDatabase.instance.execute(<<-SQL, @follower_id, @question_id, @id)
      UPDATE
        questions_follows
      SET
        follower_id = ?,
        question_id = ?
      WHERE
        id = ?
    SQL
  end

end


class Reply

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map {|datum| Reply.new(datum)}
  end

  def self.find_by_id(target_id)
    data = QuestionsDatabase.instance.execute(<<-SQL,target_id)
            SELECT
              *
            FROM
              replies
            WHERE
              id = ?
    SQL
    Reply.new(data)
  end

  def self.find_by_question_id(question_reference_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_reference_id)
            SELECT
              *
            FROM
              replies
            WHERE
              question_reference_id = ?
    SQL
    Reply.new(data)
  end

  def self.find_by_user_id(user_reference_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_reference_id)
            SELECT
              *
            FROM
              replies
            WHERE
              user_reference_id = ?
    SQL
    Reply.new(data)
  end

  attr_accessor :id, :body, :question_reference_id, :user_reference_id, :parent_reply_id
  def initialize(options)
    @id = options['id']
    @body = options['body']
    @question_reference_id = options['question_reference_id']
    @user_reference_id = options['user_reference_id']
    @parent_reply_id = options['parent_reply_id']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @body, @question_reference_id, @user_reference_id, @parent_reply_id)
      INSERT INTO
        replies
      VALUES
        (?, ?, ?, ?)  
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} is not in database" if !@id
    QuestionsDatabase.instance.execute(<<-SQL, @body, @question_reference_id, @user_reference_id, @parent_reply_id, @id)
      UPDATE
        replies
      SET
        body = ?,
        question_reference_id = ?,
        user_reference_id = ?
        parent_reply_id = ?
      WHERE
        id = ?
    SQL
  end

  def author
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        users
      WHERE
        id = @user_reference_id
    SQL
    User.new(data)
  end

  def question
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        questions
      WHERE
        id = @question_reference_id
    SQL
    Question.new(data)
  end

  def parent_reply
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        replies
      WHERE
        @id = parent_reply_id
    SQL
    Reply.new(data)
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = @id
    SQL

    data.map {|datum| Reply.new(datum)}
  end
end

class QuestionLike

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map {|datum| QuestionLike.new(datum)}
  end

  def self.find_by_id(target_id)
    data = QuestionsDatabase.instance.execute(<<-SQL,target_id)
            SELECT
              *
            FROM
              question_likes
            WHERE
              id = ?
    SQL
    QuestionLike.new(data)
  end

  def self.find_by_user_id(user_reference_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_reference_id)
            SELECT
              *
            FROM
              question_likes
            WHERE
              user_reference_id = ?
    SQL
    QuestionLike.new(data)
  end

  def self.find_question_id(question_reference_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_reference_id)
            SELECT
              *
            FROM
              question_likes
            WHERE
              question_reference_id = ?
    SQL
    QuestionLike.new(data)
  end

  attr_accessor :id, :user_reference_id, :question_reference_id
  def initialize(options)
    @id = options['id']
    @user_reference_id = options['user_reference_id']
    @question_reference_id = options['question_reference_id']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @user_reference_id, @question_reference_id)
      INSERT INTO
        question_likes
      VALUES
        (?, ?)  
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} is not in database" if !@id
    QuestionsDatabase.instance.execute(<<-SQL, @user_reference_id, @question_reference_id, @id)
      UPDATE
        question_likes
      SET
        user_reference_id = ?,
        question_reference_id = ?
      WHERE
        id = ?
    SQL
  end
end