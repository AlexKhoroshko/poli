# POLI

Poli is a web application for managing appointments between doctors and patients. It allows patients to book appointments with doctors and enables doctors to manage their appointments and leave recommendations for patients.

## Technologies Used
* Ruby 3
* Rails 7
* PostgreSQL
* HTML/CSS
* JavaScript
* Bootstrap
* Devise
* Faker
* RSpec
* Capybara

## Getting Started

1. Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/poli.git
```

2. Install dependencies:

```bash
cd poli
bundle install
```
3. Set up the database:

```bash
rails db:create
rails db:migrate
rails db:seed
```

4. Start the Rails server:

```bash
rails server
```

5. Open your web browser and visit http://localhost:3000 to access the Poli application

### Testing

```bash
bundle exec rspec
```