# Build a Celestial Bodies Database
Building a db with PostgreSQL | freeCodeCamp required project

## Instructions
For this project, we are asked to log in to PostgreSQL with psql to create our database by entering the command `psql --username=freecodecamp --dbname=postgres` in the terminal. 

We're advised to save the database by making a dump of it from a bash terminal with `pg_dump -cC --inserts -U freecodecamp universe > universe.sql`. The file will be located within the `project` folder. The database can be rebuilt by entering `psql -U postgres < universe.sql` in a terminal where the `.sql` file is. 

These are the tasks:

- Create a database named `universe`.
- Connect to the database with `\c universe` and add tables named `galaxy`, `star`, `planet`, and `moon`.
- Each table should have a primary key.
- Each primary key should automatically increment.
- Each table should have a `name` column.
- The `INT` data type should be used for at least two columns that are not a primary or foreign key.
- The `NUMERIC` data type should be used at least once.
- The `TEXT` data type should be used on at least once.
- The `BOOLEAN` data type should be used on at least two columns.
- Each 'star' should have a foreign key that references one of the rows in `galaxy`.
- Each 'planet' should have a foreign key that references one of the rows in `star`.
- Each 'moon' should have a foreign key that references one of the rows in `planet`.
- The database should have at least 5 tables.
- Each table should have at least 3 rows.
- The `galaxy` and `star` tables should have at least 6 rows each.
- The `planet` table should have at least 12 rows.
- The `moon` table should have at least 20 rows.
- Each table should have at least 3 columns.
- The `galaxy`, `star`, `planet`, and `moon` tables should each have at least 5 columns.
- At least 2 columns per table should not accept `NULL` values.
- At least 1 column from each table should be required to be `UNIQUE`.
- All columns named `name` should be of type `VARCHAR`.
- Each primary key column should follow the naming convention `table_name_id`. For example, the `moon` table should have a primary key column named `moon_id`.
- Each foreign key column should have the same name as the column it is referencing.

### Testing
All tests passed =)

![Tutorial Complete notification](tutorial_complete.png)

