#Modify depth file for MaxBin2 program
import sys
name=sys.argv[1]
runFld=sys.argv[2]

with open('{}/Bins_DB_MultiBinning/{}/coverage/{}.maxbin.depth.txt'.format(runFld, name, name),'w') as f:
      for l in open('{}/Bins_DB_MultiBinning/{}/coverage/{}.metabat.depth.txt'.format(runFld, name, name)):
          data=l.rstrip().split('\t')
          if data[0]!='contigName':
              f.write(data[0]+'\t'+data[2]+'\n')