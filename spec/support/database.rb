module Database
  def setup_database(db_name, db_config)
    begin
      ActiveRecord::Base.establish_connection(db_name.to_sym)
      ActiveRecord::Base.connection
    rescue PG::ConnectionBad
      ActiveRecord::Base.establish_connection db_config.merge('database' => nil)
      ActiveRecord::Base.connection.create_database db_config['database']
      ActiveRecord::Base.establish_connection db_config
    end
  end
end
