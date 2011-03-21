Complex Joins

Where Arel really shines in its ability to handle complex joins and aggregations. As a first example, let's consider an "adjacency list", a tree represented in a table. Suppose we have a table comments, representing a threaded discussion:

comments = Arel::Table.new(:comments)

And this table has the following attributes:

comments.columns # => [comments[:id], comments[:body], comments[:parent_id]]

The parent_id column is a foreign key from the comments table to itself. Now, joining a table to itself requires aliasing in SQL. In fact, you may alias in Arel as well:

replies = comments.alias
comments_with_replies = \
  comments.join(replies).on(replies[:parent_id].eq(comments[:id]))
# => SELECT * FROM comments INNER JOIN comments AS comments_2 WHERE comments_2.parent_id = comments.id

This will return the first comment's reply's body.
