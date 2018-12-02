def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT BOOKS.title, Books.year
  FROM series
  JOIN books
  ON Series.id = Books.series_id
  WHERE Series.id = (SELECT MIN(id) FROM series)
  ORDER BY Books.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT Characters.name, MAX(Characters.motto)
  FROM characters
  GROUP BY characters.name
  ORDER BY Characters.motto LIMIT 1"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species)
  FROM characters
  GROUP BY characters.species
  ORDER BY COUNT(species) DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT Authors.name, Subgenres.name
  FROM authors
  JOIN series
  ON Authors.id = Series.author_id
  JOIN subgenres
  ON Series.subgenre_id = Subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT title
  FROM series
  JOIN characters
  ON Characters.series_id = Series.id
  WHERE Characters.species = 'human'
  GROUP BY Series.title
  ORDER BY COUNT(Characters.species) DESC LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT Characters.name, COUNT(Character_books.id)
  FROM characters
  JOIN character_books
  ON character_books.character_id = Characters.id
  GROUP BY Characters.name
  ORDER BY COUNT(Character_books.id) DESC;"
end
