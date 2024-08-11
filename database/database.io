Table users {
  id integer
  name text
  last_name text
}

Table posts {
  id integer
  user_id integer
  title tinytext
  description text
  created timestamp
}

Table locations {
  id integer
  name tinytext
  position jsonb
}

Table images {
  id integer
  post_id integer
  file_path tinytext
}

enum reaction {
    like
}

Table reactions {
  id integer
  post_id integer [ref: < posts.id]
  reaction reaction
  user_id integer [ref: > users.id]
}


Table subscriptions {
  id integer [primary key]
  subscriber_id integer [ref: > users.id]
  following_id integer [null, ref: > users.id]
  location_id integer [null, ref: > locations.id]
}

Ref: users.id > posts.user_id

Ref: posts.id > images.post_id

Ref location_post: posts.id <> locations.id
