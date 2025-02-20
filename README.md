## README - Book Lending Library

* Ruby version: 3.4.2
* Rails version: 8.0.1

## Features

- **User Registration & Login:** Built using Rails’ `has_secure_password`.
- **Book Listings:** View all books with their availability status.
- **Borrowing:** Create a Borrowing record linking the user and book.
- **Returning:** Mark a borrowing as returned.
- **Profile Page:** View all books you currently have borrowed.

$ represents commands to be executed as they are minus the dollar sign

1. **Clone the repository:**
  $ git clone https://github.com/yourusername/book_lending_library.git
  $ cd book_lending_library
2. $ bundle install
3. $ rails db:migrate
4. $ rails server
5. Visit: http://localhost:3000
6. $ rails console
6. $ rails test