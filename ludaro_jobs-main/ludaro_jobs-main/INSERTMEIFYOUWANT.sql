 -- BEWARE!! YOU SHOULD ONLY USE THIS SQL IF THE AUTO IMPLEMENTATION OF SQL.LUA DOESNT WORK FOR YOU!
 -- IF YOU DONT KNOW WHAT IM TALKING ABOUT LET THIS FILE BE!! AND DONT INSERT IT INTO YOUR DATABASE!


CREATE TABLE IF NOT EXISTS addon_account_data (id INT AUTO_INCREMENT PRIMARY KEY, account_name VARCHAR(255), money INT, owner VARCHAR(255));
ALTER TABLE jobs ADD COLUMN interactions VARCHAR(255);
ALTER TABLE jobs ADD COLUMN ludaro_jobs_info VARCHAR(255);