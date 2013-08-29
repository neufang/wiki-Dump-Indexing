Wikipedia Dump Retrieval
=====
Given any Wikipedia dump, the simple tool parse the dump xml to get clean
Wikipedia pages, build inverted indexing for them and return pages for simple one-word queries.

Step 1: Download Wikipedia dump 
---
Step 2: XML Parsing and Index Building
-----

`source buildIndex.sh $WIKIDUMP_XML_FILE`

or 

`bzcat $WIKIDUMP_BZ2_FILE |python buildInvertedIndexFromWikiDump.py -o $INDEX_DIR`

`$WIKIDUMP_BZ2_FILE` are downloaded from 
[Wikipedia Dump](http://dumps.wikimedia.org/backup-index.html), compressing the file `$WIKIDUMP_XML_FILE`.

`$INDEX_DIR` (default is **wiki**) is the directory for saving the Wikipedia pages and indices.


After running, there are severy subdirectories in in $INDEX_DIR. Each of them contains several xml and pkl files.
**XML** file contains Wikipedia pages withtitles as docid. A **PKL** file contains the 
[inverted index](http://en.wikipedia.org/wiki/Inverted_index) for corresponding **XML** file.

**`setup.sh`** did the Step 1 and 2 together. After running it, you will get the indexing directoyr **wiki** in your
current working directory, then you can continue with Step 3.

Step 3.: Query Retrieval
-----

`python retrieveIndex.py $INDEX_DIR $Query`

`$INDEX_DIR` is generated in Step 1. `$Query` is a single word. 


Analysis
-----
`buildInvertedIndexFromWikiDump.py` mainly includes two steps: wikidump parsing and index bulding. Method **process_data()**
reads the dump file line by line, and then aggregate texts between *<page>* and *</page>* as the raw text for a page, 
which is passed to the method **process_page()**.  It calls class **WikiDocument.extract(..)** to omit html garbages and
unrelated links with regular expression. The class **OutputSplitter** will write wikipediage pages into several files.

We keep the regular Wikipedia pages and filter other pages, e.g. redirect and disambigurate pages to decrease the number of
pages for indexing. Let N be the total number of strings in regular Wikipedia, M be the number of regular expressions,
the overall complexity is approximately O(N*M).

For each XML file, `retrieveIndex.py` first build dictionaries of the title of a page to a set of its containing tokens,
then convert into dictionaries to a set of page titles. The ideal complexity of dictionary is O(1). Let K be the average 
number of page frequency for a token, the complexity of retrieval is roughly O(K).

The class **OutputSplitter** splits the collection of Wikipedia pages into chuncks. It's very practical as it's impossible
to indexing huge ammount of pages in one machine. If you manage to build such a big index, it's too big to retrieve effeciently
and fast. In real world search engine, documents are splitted and kept on several servers. Queries can be retrieved parallelly
and in real time as splitted indexing are much smaller.

Improvement
-----
Wikipedia dump can be parsed and cleaned in parrel. The Hadoop-based tool 
[Wikipedia Miner](wikipedia-miner.cms.waikato.ac.nz/) serves the purpose better.

Word querying can be easied extend to phrase querying and more complicated structural query.

Ranking of retrieval results is feasible and practically. We can add term frequency in the indexing step. Unigram probability
is calculated in the retrieval stage to rank the pages.

[Stemming](http://tartarus.org/~martin/PorterStemmer/)
