inputFile = LOAD 'hdfs:///user/sindhu/input.txt' AS (line:chararray);
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
grpd = GROUP words BY word;
totalCount = FOREACH grpd GENERATE $0, COUNT($1);
STORE totalCount INTO 'hdfs:///user/sindhu/PigOutput';