Wikipedia Dump Retrieval
=====
Given any Wikipedia dump, the simple tool parse the dump xml to get clean
Wikipedia pages, build inverted indexing for them and return pages for simple one-word queries.

Step 1: Parsing XML and Building Index
-----

`source buildIndex.sh $WIKIDUMP_XML_FILE`

or 

`bzcat $WIKIDUMP_BZ2_FILE |python buildInvertedIndexFromWikiDump.py -o $INDEX_DIR`

`$WIKIDUMP_BZ2_FILE` are downloaded from 
[Wikipedia Dump](http://dumps.wikimedia.org/backup-index.html), compressing the file `$WIKIDUMP_XML_FILE`.

`$INDEX_DIR` (default is **wiki**) is the directory for saving the Wikipedia pages and indices.


After running, there are severy subdirectories in in $INDEX_DIR. Each of them contains several xml and pkl files.
**XML** file contains Wikipedia pages withtitles as docid. A **PKL** file contains the inverted indexing for corresponding
**XML** file.

Step 2: Query Retrieval
-----

`python retrieveIndex.py $INDEX_DIR $Query`

`$INDEX_DIR` is generated in Step 1. `$Query` is a single word. 
