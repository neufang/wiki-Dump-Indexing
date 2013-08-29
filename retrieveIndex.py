import sys
import os.path as op
import pickle as pkl
from glob import glob
from buildInvertedIndexFromWikiDump import get_wiki_document_url

prefix = 'http://en.wikipedia.org/wiki/'

def searchIndex(index_dir, query):
    #get a list of indexing pickle file
    file_pattern = op.join( index_dir, "*","*.pkl")
    
    # load each indexing and search the query interatively
    print "Searching query: " + query 
    results = []
    for pkl_file in glob(file_pattern):
        print '.',
        with open(pkl_file) as f:
            inv_index = pkl.load(f)
            if query in inv_index:
                results.extend(get_wiki_document_url(title.decode('utf-8'), prefix) for title in inv_index[query])
    
    print 
    print "retrieve" ,len(results), "wikipedia articles for the query : " + query
    print "List 50 articles: "
    print "\n".join(results[:50])

if __name__ == "__main__":
    index_dir = sys.argv[1]
    query = sys.argv[2]
    searchIndex(index_dir, query)
