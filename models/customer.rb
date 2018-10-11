require_relative('../db/sql_runner')

class Customer
  attr_reader   :id
  attr_accessor :first_name, :last_name, :appointment, :requirements

  def initialize(options)
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @appointment = options["appointment"]
    @requirements = options["requirements"]
  end

  def pretty_name()
    return "#{first_name} #{last_name}"
  end

  def save()
  sql = "INSERT INTO customers
  (
    first_name,
    last_name,
    appointment,
    requirements
  )
  VALUES
  (
    $1, $2, $3, $4
  )
  RETURNING *"
  values = [@first_name, @last_name, @appointment, @requirements]
  customer_data = SqlRunner.run(sql, values)
  @id = customer_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE customers
    SET
      (
      first_name,
      last_name,
      appointment,
      requirements
      ) =
      ( $1, $2, $3, $4)
        WHERE id = $5"
    values = [@first_name, @last_name, @appointment, @requirements, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end

  def self.find (id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    customer = SqlRunner.run(sql,values)
    result = Customer.new(customer.first)
    return result
  end



end
