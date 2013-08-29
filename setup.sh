#================================================
# The scripts download the wikipedia book dump, parsing and indexing the pages
# When it finished you can run python retrieveIndex.py wiki $QUERY to retrieve queries


# Ideally It's possible to parse any wikipedia dump as long as the language can be encoded in UTF-8 with python.
# I have completed testing on Chinese, English, German, Frech, Dutch Wikipedia.
WIKI_URL=http://dumps.wikimedia.org/enwiki/20130805/enwiki-20130805-pages-meta-current1.xml-p000000010p000010000.bz2

#download wikipedia
mkdir data
wget -O data/wiki.bz2 $WIKI_URL

#parsing wiki dump and indexing
bzcat data/wiki.bz2 | python buildInvertedIndexFromWikiDump.py  -o wiki
