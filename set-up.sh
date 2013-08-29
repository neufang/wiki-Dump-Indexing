#================================================
# The scripts download the wikipedia book dump, parsing and indexing the pages
# When it finished you can run python retrieveIndex.py wiki $QUERY to retrieve queries


# Ideally It's possible to parse any wikipedia dump as long as the language can be encoded in UTF-8 with python.
# I have completed testing on Chinese, English, German, Frech, Dutch Wikipedia.
# As the English Wikipedia dump is too big, here we use the much smaller Wikibooks dump
WIKI_URL=http://dumps.wikimedia.org/enwikibooks/20130826/enwikibooks-20130826-pages-articles.xml.bz2

#download wikipedia
mkdir data
wget -O data/wiki.bz2 $WIKI_URL

#parsing wiki dump and indexing
bzcat data/wiki.bz2 | python buildInvertedIndexFromWikiDump.py  -o wiki
