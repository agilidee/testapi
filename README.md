# Testapi

A Test API for your models, factories, and database cleaner.

**Important :** NEVER use this gem in production.

## Usage

Examples with curl:

```bash
alias curl-json='curl -H "Content-Type: application/json"'
curl-json -X GET http://localhost:3000/testapi/models/User
curl-json -X POST http://localhost:3000/testapi/factories/user -d '{"attributes": {"name": "John"}}'
curl-json -X DELETE http://localhost:3000/testapi/database
```

All available routes :
```
DELETE /database           => testapi/databases#destroy
POST   /factories/:factory => testapi/factories#create
GET    /models/:model      => testapi/models#index
POST   /models/:model      => testapi/models#create
GET    /models/:model/:id  => testapi/models#show
PATCH  /models/:model/:id  => testapi/models#update
DELETE /models/:model/:id  => testapi/models#destroy
```

## Notes

DatabaseCleaner use `truncation` strategy and ignore the following tables by default :

- ar_internal_metadata
- schema_migrations
- spatial_ref_sys

You can change it using :

```ruby
Testapi.database_cleaner_ignored_tables = %w(my_table)
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem "testapi", group: [:development, :test]
```

And then execute:
```bash
$ bundle
```

Add this to `routes.rb`:

```ruby
if Rails.env.development? || Rails.env.test?
  mount Testapi::Engine => "/testapi"
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
