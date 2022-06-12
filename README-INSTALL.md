### 1. Run in Local

* PostgreSQL installed
* Ruby 2.7.0+ required, Ruby 3.0+ preferred
* Setup PostgreSQL configuration in `config/database.yml`

* Bundle install
```html
bundle install
```

* Database creation(If it doesn't exist)
```html
bundle exec rails db:create
```

* Database migration
```html
bundle exec rails db:migrate
```

* Start server
```html
bundle exec rails server
```

* Run Rspec
```html
bundle exec rspec spec/
```

### 2. Run with Docker

#### Docker
```html
https://docs.docker.com/get-docker/
```

#### Docker Compose
```html
https://docs.docker.com/compose/install/
```

#### Build & run docker applications

* Build
```html
docker-compose build
```

* Run
```html
docker-compose up
```

### 3. Endpoints
#### Encode(method: POST)
```html
/api/v1/encode
```

* Parameters
```html
{
  original_url: 'https://www.google.com/'
}
```

#### Decode(method: GET)
```html
/api/v1/decode
```

* Parameters
```html
{
  token: 'ikWYAzAU'
}
```