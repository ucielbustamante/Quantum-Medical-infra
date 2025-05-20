CREATE USER myapp_test_user WITH ENCRYPTED PASSWORD 'secret';
CREATE DATABASE myapp_test OWNER myapp_test_user;
GRANT ALL PRIVILEGES ON DATABASE myapp_test TO myapp_test_user;
