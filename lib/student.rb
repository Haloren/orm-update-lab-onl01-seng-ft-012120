require_relative "../config/environment.rb"

class Student

def initialize (id = nil, name, grade)
  @id = id
  @name = name 
  @grade = grade
end   

def self.create_table 
  sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        grade TEXT
        )
        SQL
    DB[:conn].execute(sql)
end 

def self.drop_table
  sql = "DROP TABLE students"
  DB[:conn].execute(sql)
end 

def save 
  sql = <<-SQL
      INSERT INTO students (name, grade) 
      VALUES (?, ?)
    SQL
 
    DB[:conn].execute(sql, self.name, self.grade)
 
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
end   

def self.create 
  
end 

def self.new_from_db(row)
  new_song = self.new  # self.new is the same as running Song.new
  new_song.id = row[0]
  new_song.name =  row[1]
  new_song.length = row[2]
  new_song  # return the newly created instance
end 

def self.find_by_name
  
end 

def update
  
end   

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

end
