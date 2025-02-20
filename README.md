## README - Book Lending Library

* Ruby version: 3.4.2
* Rails version: 8.0.1

## Features

- **User Registration & Login:** Built using Rails’ `has_secure_password`.
- **Book Listings:** View all books with their availability status.
- **Borrowing:** Create a borrowing record linking the user and book.
- **Returning:** Mark a borrowing as returned.
- **Profile Page:** View all books you currently have borrowed.


1. **Clone the repository:**
```bash
  git clone https://github.com/iamtheuri/book_lending_library
  cd book_lending_library
```
2. **Install dependencies**
```bash
  bundle install
```
3. **Migrate database**
```bash
  rails db:migrate
```
4. **Spin up Puma server**
```bash
  rails server
```
5. **Open http://localhost:3000 on your browser to view the application**
6. **Interact with console to manipulate or fetch db records**
```bash
  rails console
```
7. **Run unit tests**
```bash
  rails test
```