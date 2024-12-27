# Celestial Bodies Database

## Instructions
For this project, you need to log in to PostgreSQL with `psql` to create your database. Do that by entering the following command in the terminal:

`psql --username=freecodecamp --dbname=postgres`

Make all the tests below pass to complete the project. Be sure to get creative, and have fun!

**Don't forget to connect to your database after you create it** 😄

Here are some ideas for other column and table names:
- `description`
- `has_life`
- `is_spherical`
- `age_in_millions_of_years`
- `planet_types`
- `galaxy_types`
- `distance_from_earth`

### Notes:
- If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering the following command in a bash terminal (not the `psql` one):

`pg_dump -cC --inserts -U freecodecamp universe > universe.sql`

This will save the commands to rebuild your database in `universe.sql`. The file will be located where the command was entered. If it's inside the project folder, the file will be saved in the VM. You can rebuild the database by entering:

`psql -U postgres < universe.sql`

in a terminal where the `.sql` file is located.

- If you are saving your progress on freeCodeCamp.org, after getting all the tests to pass, follow the instructions above to save a dump of your database. Save the `universe.sql` file in a public repository and submit the URL to it on freeCodeCamp.org.

## Complete the tasks below:

1. You should create a database named `universe`.
2. Be sure to connect to your database with: `\c universe`.
3. You should add tables named `galaxy`, `star`, `planet`, and `moon`.
4. Each table should have a primary key.
5. Each primary key should automatically increment.
6. Each table should have a `name` column.
7. You should use the `INT` data type for at least two columns that are not a primary or foreign key.
8. You should use the `NUMERIC` data type at least once.
9. You should use the `TEXT` data type at least once.
10. You should use the `BOOLEAN` data type on at least two columns.
11. Each `star` should have a foreign key that references one of the rows in `galaxy`.
12. Each `planet` should have a foreign key that references one of the rows in `star`.
13. Each `moon` should have a foreign key that references one of the rows in `planet`.
14. Your database should have at least five tables.
15. Each table should have at least three rows.
16. The `galaxy` and `star` tables should each have at least six rows.
17. The `planet` table should have at least 12 rows.
18. The `moon` table should have at least 20 rows.
19. Each table should have at least three columns.
20. The `galaxy`, `star`, `planet`, and `moon` tables should each have at least five columns.
21. At least two columns per table should not accept `NULL` values.
22. At least one column from each table should be required to be `UNIQUE`.
23. All columns named `name` should be of type `VARCHAR`.
24. Each primary key column should follow the naming convention `table_name_id`. For example, the `moon` table should have a primary key column named `moon_id`.
25. Each foreign key column should have the same name as the column it is referencing.

## Example Database Structure

### Tables:
- **galaxy**: Contains information about galaxies.
- **star**: Contains information about stars, with a foreign key referencing `galaxy`.
- **planet**: Contains information about planets, with a foreign key referencing `star`.
- **moon**: Contains information about moons, with a foreign key referencing `planet`.

### Sample Columns:
- **name**: Should be `VARCHAR`.
- **ID**: Should follow the `table_name_id` convention and be the primary key.
- **foreign keys**: Should reference the corresponding table's primary key.
- **other columns**: Various data types such as `INT`, `NUMERIC`, `TEXT`, and `BOOLEAN`.

Good luck and have fun building your celestial bodies database! 🌌✨