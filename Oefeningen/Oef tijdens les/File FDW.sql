select *
 from   pg_available_extensions
 where  name='file_fdw';
 
create extension file_fdw;

create server file_server foreign data wrapper file_fdw;

CREATE FOREIGN TABLE file_organisations_seven (
    index SMALLINT,
    organization_id VARCHAR(255),
    name VARCHAR(255),
    website VARCHAR(255),
    country VARCHAR(255),
    description TEXT,
    founded INT,
    industry VARCHAR(255),
    number_of_employees INT
)
SERVER file_server
OPTIONS (
    filename 'C:\Program Files\PostgreSQL\16\data\organizations-100.csv',
    format 'csv',
    delimiter ',',
    header 'true'
);
select *
 from   file_organisations_seven;
 