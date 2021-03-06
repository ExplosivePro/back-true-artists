# TrueArtists

## Prerequisites
- Install `rvm` -> \curl -sSL https://get.rvm.io | bash
- Install `ruby` -> \curl -sSL https://get.rvm.io | bash -s stable --ruby
- Install `Mysql` or Postgres ->
- Install Redis server
- Install Elastic search -> https://www.elastic.co/guide/en/elasticsearch/reference/current/brew.html

## Setup
1. Clone the repository
2. Go into the directory of the repo
3. Run `bundle install`
4. Run `cp config/database.yml.example config/database.yml`
5. Run `cp config/application.yml.exmple config/application.yml`
6. Run `cp config/storage.yml.example config/storage.yml`
7. Run `bundle exec rails db:create; bundle exec rails db:migrate`
8. Run server

## Testing ActionMailbox in development

#### Configuration
Domain **trueartists.xyz** has already registered and verified on SendGrid.
If you don't want to change domain, skip into 3.

1. Authenticate email domain on SendGrid.
2. Add fowlloing SMTP configuration.

```
config.action_mailer.smtp_settings = {
  user_name: 'apikey',
  password: Rails.application.credentials[:SENDGRID_APIKEY]
  domain: [Test Domain],
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
config.action_mailer.delivery_method = :smtp
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = false
config.action_mailbox.ingress = :sendgrid
```
3. Install ngrok and run it.
4. Go to [SendGrid Inbound Parse](https://app.sendgrid.com/settings/parse) page and add Host & URL.
```
https://actionmailbox:INGRESS_PASSWORD@SERVER_PUBLIC_URL/rails/action_mailbox/sendgrid/inbound_emails
```
- You can read **INGRESS_PASSWORD** from credentials file.
- **SERVER_PUBLIC_URL** is ngrok forwarding URL.
* Check **POST the raw, full MIME message** option.

For example:
> https://actionmailbox:TrueArtists@3a61d.ngrok.io/rails/action_mailbox/sendgrid/inbound_emails


#### Sending/Receiving emails
- bundle exec rails c
- Create sending, receiving users
- Create a message record
- Run this command
```
MessageMailingService.new(message_record).send
```
Check email in the receiver's mailbox and reply it.
You will see incoming webhook request on ngrok window a few seconds later.
The original sender recipient of this thread will receive reply email.

Also, you can check **Message** and **MessageMail** records in rails console.



For more details, read these articles.
[https://dev.to/rob__race/using-action-mailbox-in-rails-6-to-receive-mail-2nje](https://dev.to/rob__race/using-action-mailbox-in-rails-6-to-receive-mail-2nje)
[blog.saeloun.com/2019/11/11/rails-6-action-mailbox-tryout.html](blog.saeloun.com/2019/11/11/rails-6-action-mailbox-tryout.html)
