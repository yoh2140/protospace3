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
* text
* user_id(association)
* prototype(association)

# Like
* user_id(association)
* prototype(association)

# CapturedImage
* image
* status
* prototype_id(association)

# Association
* User has_many Prototypes
* User has_many Comments
* User has_many Likes
* Prototype has_many Comments
* Prototype has_many Likes
* Prototype has_many CaputuredImage
* Prototype belongs_to User
* Comment belongs_to User
* Comment belongs_to Prototype
* Like belongs_to User
* Like belongs_to Prototype
* CapturedImage belongs_to Prototype
