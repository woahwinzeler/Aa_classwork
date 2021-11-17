def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.

  # actors = Actor.joins(:movies).select('movies.title, movies.id').includes(:movies)

  # those_actors.all? do |actor|
  #   actors.find_by('name = ?', actor)
  # end

  #group by movies

  Movie
    .select(:title, :id)
    .joins(:actors)
    .where('actors.name IN (?)', those_actors)
    .group(:id)
    .having('COUNT(actors.id) = ?', those_actors.length)

    # those_actors.each {|actor| relation = relation.where('actors.name IN (?)', actor)}
    # relation
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
  .select('AVG(score)')
  .group('yr')
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery

end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end