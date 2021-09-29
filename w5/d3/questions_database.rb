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

class Question
  def self.find_by_id(id)
    #should look up and ID in the table and return an object represeting a row
    questions = QuestionsDatabase.execute(<<-SQL, id)
    SELECT *
    FROM questions
    WHERE id = ?
    SQL
  end

  attr_reader :id, :title, :body, :users_id
  def initialize(hash)
    @id = hash['id']
    @title = hash['title']
    @body = hash['body']
    @users_id = hash['users_id']
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
  end

  attr_reader :id, :fname, :lname
  def initialize(hash)
    @id = hash[id]
    @fname = hash[fname]
    @lname = hash[lname]
  end

end