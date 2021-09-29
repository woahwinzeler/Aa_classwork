require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database 
  include 'singleton'

end 

class Question
  def self.find_by_id()
    #should look up and ID in the table and return an object represeting a row 
  end

  def initialzie(hash)
    @id = hash[id]
    @title = hash[title]
    @body = hash[body]
    @users_id = hash[users_id]
  end

end