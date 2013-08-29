#parsing wiki dump
cat $1 | python buildInvertedIndexFromWikiDump.py  -o wiki
