#User
* username
* avatar
* member
* profile
* works
* e-mail(devise)
* password(devise)

# Prototype
* title
* cach_copy
* concept
* user_id(association)

# Comment
* content
* user_id(association)
* prototype(association)

# Like
* user_id(association)
* prototype(association)

# Image
* content
* prototype_id(association)

# Association
* User has_many Prototypes
* User has_many Comments
* User has_many Likes
* Prototype has_many Comments
* Prototype has_many Likes
* Prototype has_many Image
* Prototype belongs_to User
* Comment belongs_to User
* Comment belongs_to Prototype
* Like belongs_to User
* Like belongs_to Prototype
* Image belongs_to Prototype
