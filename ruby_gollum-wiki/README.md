# Usage :

## PRE: mkdir wiki/

### docker build . -t ruby_gollum-wiki

### docker run -d --name my_wiki -v wiki:/wiki/ -p4567:4567 ruby_gollum-wiki
#### YOU CAN MAP THE EXTERNAL PORT TO WHATEVER YOU LIKE

### docker exec -it my_wiki bash
## cd /wiki/ (should already be in that directory)
## git init

#### OPEN BROWSER TO x.x.x.x:4567

## To save wiki , run the following

### docker exec my_wiki tar cjf my_wiki_backup.tar.bz2 /wiki/

### docker cp my_wiki:/wiki/my_wiki_backup.tar.bz2 .
