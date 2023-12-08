desc 'my task'
task task1: :environment do
  User.first
  ActiveRecord::Base.connected_to(role: :reading) do
    puts ActiveRecord::Base.connection.current_database
    # User.first
  end

  ActiveRecord::Base.connected_to(role: :writing) do
    puts ActiveRecord::Base.connection.current_database
    # User.first
  end
end
