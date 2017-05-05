# Create the user


User.create!(full_name: 'Minh Nguyen',
  email: 'a@example.com',
  password: 'asdf' 
);

User.create!(full_name: 'Nguyen Van A',
  email: 'b@example.com',
  password: 'asdf' 
);

user_1 = User.first

user_1.blogs.create!(
  title: 'Say hello',
  content: 'Hello,

My name is Minh

I love to know you. My skills are:

* HTML, CSS
* Ruby, RoR framework
* Python, Bash.

You can add me on the [facebook](https://www.facebook.com/huy.minh.coi)'
)

user_1.blogs.create!(
  title: 'Just a random test',
  content: 'This is just a sample test which uses markdown syntax

## This is a header

### This is also a header

This is a list

* 1 item
* 2 item
'
)