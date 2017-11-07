class << Testapi
  attr_writer :database_cleaner_ignored_tables

  def database_cleaner_ignored_tables
    @database_cleaner_ignored_tables ||= %w(
      ar_internal_metadata
      schema_migrations
      spatial_ref_sys
    )
  end
end
