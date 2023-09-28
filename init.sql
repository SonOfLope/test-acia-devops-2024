CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE EXTENSION IF NOT EXISTS "vector"; 

CREATE TABLE example (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    text TEXT,
    vector vector(1536)
);

INSERT INTO example (text, vector)
VALUES 
    ('example text 1', ARRAY(SELECT generate_series(1,1536))),
    ('example text 2', ARRAY(SELECT generate_series(1,1536))); 