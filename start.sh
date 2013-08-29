WIKI_URL=http://dumps.wikimedia.org/nlwiki/20130826/nlwiki-20130826-pages-articles1.xml.bz2
#download wikipedia
mkdir data
wget -O data/wiki.bz2 $WIKI_URL

#parsing wiki dump
bzcat data/wiki.bz2 | python buildInvertedIndexFromWikiDump.py  -o wiki
