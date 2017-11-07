class Testapi::DatabasesController < Testapi::ApplicationController
  def destroy
    DatabaseCleaner.clean_with(:truncation, except: Testapi.database_cleaner_ignored_tables)
    render_json
  end
end
