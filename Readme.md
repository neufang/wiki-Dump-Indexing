Wikipedia Dump Retrieval
=====
Given any Wikipedia dump, the simple tool parse the dump xml to get clean
Wikipedia pages, build inverted indexing for them and return pages for simple one-word queries.

Parsing XML and Building Index
-----

`source buildIndex.sh $WIKIDUMP_XML_FILE`

or 

`bzcat $WIKIDUMP_BZ2_FILE |python buildInvertedIndexFromWikiDump.py -o $INDEX_DIR`

`$WIKIDUMP_XML_FILE` and `$WIKIDUMP_BZ2_FILE` are downloaded from 
[Wikipedia Dump](http://dumps.wikimedia.org/backup-index.html).

`$INDEX_DIR` (default is **wiki**) is the directory for saving the Wikipedia pages and indices.
