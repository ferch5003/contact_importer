# README

This is App has the goal to import your contacts in order to have the management of them.

You can import them through CSV files, and this contact may have the following attributes:

- Name
- Email
- Telephone
- Address
- Date of Birth
- Credit Card
- Franchise

To run the project first copy the .envars file in the roor of the project and call it .env, then write the credentials in this file. Then run this steps:

1. sudo service redis-server start (In Linux, You have to have Redis installed for this step)
2. bundle
3. rails db:create db:migrate
4. (optional) rails db:setup
5. foreman start -f Procfile.dev

Both in development and in production sidekiq and AWS S3 are used.

Link to the application server
[Contact Management App](https://c-importer-app.herokuapp.com/)

Link to the schema if you need to test contacts:
[Schema](https://www.mockaroo.com/0b47ac00/)