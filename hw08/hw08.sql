CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT dogs.name AS name, sizes.size AS size FROM dogs AS dogs, sizes AS sizes WHERE sizes.min < dogs.height AND dogs.height <= sizes.max ORDER BY dogs.name;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child FROM parents, dogs WHERE parent = name ORDER BY height DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child AS first, b.child AS second FROM parents AS a, parents AS b WHERE a.parent = b.parent AND a.child < b.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT first || ' and ' || second || ' are ' || a.size || ' siblings' From siblings, size_of_dogs AS a, size_of_dogs AS b WHERE first = a.name AND second = b.name AND a.size = b.size;


-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height, n);

-- Add your INSERT INTOs here
INSERT INTO stacks_helper SELECT dogs.name, dogs.height, dogs.height, 1 FROM dogs;
INSERT INTO stacks_helper SELECT helper.dogs || ', ' || dogs.name, helper.stack_height+dogs.height, dogs.height, 2 FROM stacks_helper as helper, dogs WHERE dogs.height > helper.last_height;
INSERT INTO stacks_helper SELECT helper.dogs || ', ' || dogs.name, helper.stack_height+dogs.height, dogs.height, 3 FROM stacks_helper as helper, dogs WHERE dogs.height > helper.last_height;
INSERT INTO stacks_helper SELECT helper.dogs || ', ' || dogs.name, helper.stack_height+dogs.height, dogs.height, 4 FROM stacks_helper as helper, dogs WHERE dogs.height > helper.last_height;

CREATE TABLE stacks AS
  SELECT dogs, stack_height FROM stacks_helper WHERE n = 4 AND stack_height > 170 ORDER BY stack_height;

