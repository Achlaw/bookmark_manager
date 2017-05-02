
## Creating a database
CREATE DATABASE <name> WITH OWNER alexlaw ENCODING 'UTF8';

## Creating a table
CREATE TABLE <name>(id serial PRIMARY KEY, name varchar(40) );

## Delete a table
DROP TABLE <name>;

HINT: Put ; at the end of every command.
      Enter same command twice if it fails the first time.

## Selecting a row.
SELECT * FROM <name of table>

## Adding row to a table
INSERT INTO <name of table> VALUES( 12345, 'Steve');

## Deleting a row
DELETE FROM <name of table> WHERE ID = <id you assigned>;

## Deleting multiple rows
DELETE FROM <name of table> WHERE ID > 2

## Updating existing row
UPDATE <name of table> SET <id> = '23456' WHERE <id> = '12345'


## Turn on data_mapper error logging in irb
DataMapper::Logger.new($stdout, :debug)


--------------------------------
## Inserting into server database within irb
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
DataMapper.setup(:default, 'postgres://localhost/database_play')
DataMapper::Logger.new($stdout, :debug)

class Student
include DataMapper::Resource
property :id, Serial
property :name, String
end
DataMapper.finalize
DataMapper.auto_upgrade!

@student = Student.create(name: 'Bill)

--------------------------------

## Destroying information
student = Student.get(5)   # This will find the id of 5
student.destroy #puts that row into student so you can destroy student and the row.

One line version:  Student.first(name: 'Name').destroy
http://datamapper.org/docs/create_and_destroy.html

## Duplicating a database
CREATE DATABASE newdb WITH TEMPLATE originaldb OWNER dbuser;
