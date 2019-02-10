REST API for Blog

Models:
- Post ( title, body, author, published_at )
- Comment ( body, author, published_at )
- User ( nickname, email, password )

Endpoints:
- Authentication: POST -> /auth/login
- Create post: POST -> /api/v1/posts.json
- Show post: GET -> /api/v1/posts/:post_id.json
- Index posts by pages: GET -> /api/v1/posts.json
- Report posts and comment via mailer: POST -> /api/v1/reports/by_author.json params: email, start_date, end_date

* Ruby version - ruby 2.6.0p0 (2018-12-25 revision 66547)

* Rails version - 5.2.2

* API versionist

* Database - PostgreSQL

* Testing - Rspec 3.6

* Json — ActiveModelSerializer

* Json Web Token authentication

Heroku: https://still-badlands-56815.herokuapp.com/
