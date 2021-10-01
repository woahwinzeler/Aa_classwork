def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie.where('yr >= 1980 AND yr <= 1989').where('score >= 3 AND score <= 5').select(:id, :title, :yr, :score)
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie
  .group(:yr)
  .having('MAX(movies.score) <= 8')
  .pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.

  Actor.select(:id, :name)
    .joins(:movies)
    .where('movies.title = ?', title)
    .order('castings.ord ASC')
   
  # casts = Movie
  # .joins(:castings)
  # .joins(:actors)
  # .where('title = (?)', title)
  # .order('castings.ord')
  # .pluck('castings.actor_id')



  # casts = Movie
  # .joins(:castings)
  # .where('title = (?)', title)
  # .order('castings.ord')
  # .pluck('castings.actor_id')

  # new_arr = []
  # casts.each_with_index {|actor, idx| new_arr << Actor.find(actor)}
  # new_arr
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  Movie.joins(:actors)
    .where('movies.director_id = castings.actor_id AND castings.ord = 1')
    .select('movies.id, movies.title, actors.name')

end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  
  Casting
    .where('ord > 1')
    .select('actors.id, actors.name, COUNT(*) AS roles')
    .group('actors.id')
    .joins(:actor)
    .limit(2)
    .order('COUNT(*) DESC')

end
