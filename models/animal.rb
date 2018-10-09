require_relative('../db/sql_runner')

class Animal

  attr_accessor :animal_name, :species, :age, :training, :adoptable, :admission_date, :id

  def initialize (options)
    @id = options['id'].to_i
    @animal_name = options['animal_name']
    @species = options['species']
    @age = options['age'].to_i
    @training = options['training']
    @adoptable = options['adoptable']
    @admission_date = options['admission_date']
  end

  def save()
    sql = "INSERT INTO animals
    (
      animal_name,
      species,
      age,
      training,
      adoptable,
      admission_date
    )
    VALUES
    (  $1, $2, $3, $4, $5, $6)
    RETURNING *"
    values = [@animal_name, @species, @age, @training, @adoptable, @admission_date]
    animal_data = SqlRunner.run(sql, values)
    @id = animal_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE animals
    SET
      (
      animal_name,
      species,
      age,
      training,
      adoptable,
      admission_date
      ) =
      ( $1, $2, $3, $4, $5, $6)
        WHERE id = $7"
    values = [@animal_name, @species, @age, @training, @adoptable, @admission_date, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM animals;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM animals"
    animals = SqlRunner.run(sql)
    result = animals.map{|animal| Animal.new(animal)}
    return result
  end

  def self.find (id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    animal = SqlRunner.run(sql,values)
    result = Animal.new(animal.first)
    return result
  end




end
