# User
* username:         :string
* avatar            :text
* member            :text
* profile           :text
* works             :text
* e-mail(devise)    :string
* password(devise)  :string

# Prototype
* title                   :string
* cach_copy               :text
* concept                 :text
* user(association)    :reference

# Comment
* content                 :text
* user(association)    :reference
* prototype(association)  :reference

# Like
* user(association)    :reference
* prototype(association)  :reference

# Image
* content                   :text
* prototype(association) :reference

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
