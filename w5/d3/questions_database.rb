require 'sqlite3'
require 'singleton'
require 'byebug'

# module TableMethods 
#   def find_by(table_name, attribute, attribute_val)
#     #debugger 
#     QuestionsDatabase.instance.execute(<<-SQL, table_name: table_name)
#     SELECT *
#     FROM :table_name
#     WHERE id = 1
#     SQL
#   end
# end

#'questions' --> questions; 'id' --> id; id --> id; 

class QuestionsDatabase < SQLite3::Database 
  include Singleton


  def initialize
    #type translation allows results as hash to turn default array into hash
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end 

class Question
  # include TableMethods

  def self.find_by_id(id)

    # p find_by('questions', 'id', id)
    #should look up and ID in the table and return an object represeting a row
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM questions
    WHERE id = ?
    SQL
    #need to create an object
    self.new(question.first)
  end

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT *
    FROM questions
    WHERE users_id = ?
    SQL
    #need to create an object
    question.map{|q| self.new(q)}
    # self.new(question.first)
  end

  attr_reader :id, :title, :body, :users_id
  def initialize(hash)
    @id = hash['id']
    @title = hash['title']
    @body = hash['body']
    @users_id = hash['users_id']
  end

  def author 
    Users.find_by_id(self.id)
  end

  def replies 
    #finds replies to a question
    Replies.find_by_question_id(self.id)
  end

  def followers 
    QuestionFollows.followers_for_question_id(self.id)
  end

end

class Users
  def self.find_by_id(id)
    #should look up and ID in the table and return an object represeting a row
    users = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM users
    WHERE id = ?
    SQL

    self.new(users.first)
  end

  def self.find_by_name(fname, lname)
    #should look up and ID in the table and return an object represeting a row
    users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT *
    FROM users
    WHERE fname = ? AND lname = ?
    SQL

    self.new(users.first)
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies 
    Replies.find_by_user_id(self.id)
  end

  attr_reader :id, :fname, :lname
  def initialize(hash)
    @id = hash['id']
    @fname = hash['fname']
    @lname = hash['lname']
  end

  def followed_questions 
    QuestionFollows.followed_questions_for_user_id(self.id)
  end

end

class QuestionFollows
  # include TableMethods

  def self.most_followed_questions(n)
    #fetches n most-followed questions
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT 
        questions_id
      FROM
      questions JOIN question_follows 
      ON questions.id = question_follows.questions_id
      GROUP BY 
        questions_id
      ORDER BY 
        COUNT(question_follows.users_id) DESC 
      LIMIT
        ?
      SQL
      # questions.map{|hash| hash['questions_id'].nil? ? {'questions_id' => 0} : hash } use somehting like this if left outer join
      questions.map{|q_hash| Question.find_by_id(q_hash['questions_id'])}
  end

  def self.find_by_id(id)

    # p find_by('questions', 'id', id)
    #should look up and ID in the table and return an object represeting a row
    question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM question_follows
    WHERE relationships = ?
    SQL
    #need to create an object
    
    question_follows.map{|follow_hash| self.new(follow_hash)}
  end

  def self.followers_for_question_id(question_id)
    question_follows = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT users_id
    FROM question_follows
    WHERE questions_id = ?
    SQL
    
    question_follows.map{|hash| Users.find_by_id(hash['users_id'])}
    # question_follows.map{|follow_hash| self.new(follow_hash)}
  end

  attr_reader :relationships, :users_id, :questions_id
  def initialize(hash)
    @relationships = hash['relationships']
    @users_id = hash['users_id']
    @questions_id = hash['questions_id']
  end

  def self.followed_questions_for_user_id(usr_id)
    #returns an array of question objects
    questions = QuestionsDatabase.instance.execute(<<-SQL, usr_id)
    SELECT 
      questions_id
    FROM
    question_follows JOIN questions 
    ON question_follows.users_id = questions.users_id
    WHERE
      question_follows.users_id = ?
    SQL

   questions.map{|q_hash| Question.find_by_id(q_hash["questions_id"]) }

  end
end

class Replies
  # include TableMethods

  def self.find_by_id(id)

    # p find_by('questions', 'id', id)
    #should look up and ID in the table and return an object represeting a row
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM replies
    WHERE id = ?
    SQL
    #need to create an object
    self.new(reply.first)
  end

  def self.find_by_user_id(users_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, users_id)
    SELECT *
    FROM replies
    WHERE users_id = ?
    SQL
    replies.map{|reply| self.new(reply)} unless replies.empty?
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT *
    FROM replies
    WHERE questions_id = ?
    SQL
    replies.map{|reply| self.new(reply)}
  end

  def self.find_by_parent(parent_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
    SELECT *
    FROM replies
    WHERE parent_id = ?
    SQL
    replies.map{|reply| self.new(reply)} unless replies.empty?
  end


  attr_reader :id, :body, :users_id, :questions_id, :parent_id
  def initialize(hash)
    @id = hash['id']
    @body = hash['body']
    @questions_id = hash['questions_id']
    @users_id = hash['users_id']
    @parent_id = hash['parent_id']
  end

  def author
    Users.find_by_id(self.users_id)
  end

  def question
    Question.find_by_author_id(self.users_id)
  end 

  def parent_reply
    pr = Replies.find_by_user_id(self.parent_id) 
    pr.nil? ? nil : pr 
  end

  def child_replies
    Replies.find_by_parent(self.id)
  end

end

class QuestionLikes
  # include TableMethods

  def self.find_by_id(id)

    # p find_by('questions', 'id', id)
    #should look up and ID in the table and return an object represeting a row
    question_likes = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM question_likes
    WHERE id = ?
    SQL
    #need to create an object
    self.new(question_likes.first)
  end

  attr_reader :id, :users_id, :question_id
  def initialize(hash)
    @id = hash['id']
    @question_id = hash['questions_id']
    @users_id = hash['users_id']
  end

end

p q1 = Question.find_by_id(1)
p Replies.find_by_question_id(1)
p Replies.find_by_user_id(1)
p gw = Users.find_by_name("George", "Washington")
p gw_questions = gw.authored_questions
p gw.authored_replies
p gw_questions.first.author 
p gw_questions.first.replies 
p gw_questions.first.replies.first.author
p gw_questions.first.replies.first.question
p gw_questions.first.replies.first.parent_reply
p gw_questions.first.replies.first.child_replies
p QuestionFollows.followers_for_question_id(2)
p QuestionFollows.followed_questions_for_user_id(1)
p gw.followed_questions
p Question.find_by_id(2).followers
p QuestionFollows.most_followed_questions(3)