## What is this project ? ##
CAS server


## Quick start & test ##
To execute sql statement  
[sql.sql](https://github.com/jasonsoso/jason-sso/blob/master/src/main/resources/META-INF/sql/sql.sql "sql")

To start quickly, build the project:

`git clone https://github.com/jasonsoso/jason-sso.git`   
`cd jason-sso`   
`mvn clean install`   

To start this application with jetty:  
`mvn compile jetty:run`  



To test:   

call the `http://localhost:9090/` url  
be sent to CAS server and log in (username:jasonsoso;password:jasonsoso)
