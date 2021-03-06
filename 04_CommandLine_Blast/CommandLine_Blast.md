---
title: "CommandLine_BLAST"
author: "Zachary Noel"
date: "July 15, 2016"
output:
  html_document:
    keep_md: yes
---

###### This document provides instuctions on how to use command line BLAST and BLAST+ using a local database and using a specific database on NCBI. This is not an extensive tutorial, but rather is a basic introduction to speeding up your BLAST searches, or searching a large number of sequences quickley.
Other options and instructions and be found [here](http://www.ncbi.nlm.nih.gov/books/NBK279675/). 

# Installation
Install BLAST+ from NCBI [ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/](ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/)

There are multiple files to choose from.

* Mac users the easiest would be to download and install the "disk image" file (.dmg) and follow the installation instructions. 
* Windows: .exe 
* Linux: linux.tar.gz 
* You can also install from source from any of the respective tar.gz files.

Everthing should be installed into /usr/local/bin and should therefore be executable from the command line. 

# Getting set-up
First let's learn some quick and useful commands that can be helpful in setting up the files nessesary to do this. It may not be nessesary to do this depending on the sofware you used to assemble your sequences. 

Open your terminal and navigate to your folder cooresponding all the assembled .fasta files for each well of your 96 well plate.  

```bash
cd "/dir_path"
```
The easy way to do this would be to just type cd and drag and drop the folder into the terminal window then press enter 

I've found that when dealing with a large number of files, especially .fasta files, it can be difficult to select all those files in a directory and move them, if done by hand. So we are going to use a command using terminal (or command prompt) to select all files with the extension ".fa" (or any extention you want) and put that in a new folder/directory. First, however, we need to make  new directory. We can do this all at once using the following commands.


```bash
mkdir newdir
```
Here we use the "mkdir" command to make a new directory called "newdir", however you can call it whatever you choose. 

Then we select all the files ending with .fa and copy (cp) them to the newdir we created above. 

```bash
find . -name \*.fa -exec cp {} \newdir \;
```

navigate to the directory with all the new .fasta files and concatenate them together into new file using the following command. The resulting file will be a .fasta file called combined.fasta. 

```bash
cat *.fasta > combined.fasta
```

Now copy your combine.fasta into the directory created called BlastDB. If you need to make a new directory do this. 
I keep this on the main user directory, denoted by the ~ ("tilda" symbol)


```bash
# if you need to create a new directory called BlastDB and copy combined.fasta to that directory. 
cd ~/ # navagate to your home directory 
mkdir BlastDB # make new directory 
cp combine.fasta ~/BlastDB
```

# Creating a local blast database to search

I am going to create a database from the ~3000 sequences Alejo sequenced as an example we are going to call it oscap_db


```bash
makeblastdb -in Seqs_11_12.final.fasta -title oscap_db -parse_seqids -dbtype nucl
```
You make a blast database using the "makeblastdb" command then specifying the follwing options using the - ("flags").

English translation 

* make a blast database using the file Seqs_11_12.final.fasta (-in), 
* call it oscap_db (-title), 
* separate the fasta file into separate sequences using the sequence IDs (-parse_seqids), 
* and we are using a nucleotide database (-dbtype). 

# BLAST+ on local database

Now that we set up this database we can now search this database using the combined.fasta file we created earlier. 


```bash
blastn -db Seqs_11_12.final.fasta -query combine.fasta -out combine_local.csv -outfmt 10  
```

English translation: 

* do a nucleotide blast using the database fasta file Seqs_11_12.final.fasta (-db) 
* using the combine.fasta file to search (-query) 
* and save the output in a .csv file (-outfmt 10) 

The flag -max_target_seqs should be used with extreme caution!! with this you flag you are going to be saving the first best hit in the database, not nessesarily the best hit so please be careful when using this flag. The first best hit can depend on the database used and the order of the database, so use this only if you want to obtain a quick and general result, but do not interpret this as the best hit.

Link to paper explaining this misunderstanding
https://academic.oup.com/bioinformatics/advance-article/doi/10.1093/bioinformatics/bty833/5106166

# BLAST+ on a remote database

Next we will perform a remote BLAST search on NCBI using the entrez query of only looking for sequences from Robideau in oomycetes and ITS not COI as an example. 


```bash
blastn -db nt -query combine.fasta -out combine_online.csv -outfmt "10 qseqid salltitles staxids sseqid pident length mismatch gapopen qstart qend sstart send " -remote -entrez_query "robideau[author] AND oomycetes[orgn] AND Internal Transcribed spacer NOT COI"
```

English translation: 

* do a nucleotide blast using the nuclotide database (-db) 
* on NCBI (-remote) 
* with the conditions such that robideau is the author, oomycetes are the organism, and with the words Internal Transcribed spacer in the title, not COI (-entrez_query), 
* using the combine.fasta file (-query) to search 
* and save the output in a .csv file (-outfmt "10..) 
* named combine_online.csv (-out) keeping the sequence ID and the rest of the following information inside quotes 

Other information: When performing a BLAST+ on NCBI it is advisable to first set up an account that way they know who is using NCBI and using their server to search. With only about 96 sequences to search, this is not a problem, but with many more sequences to search it is advisable to have an account. 

You can sign up here [https://www.ncbi.nlm.nih.gov/account/](https://www.ncbi.nlm.nih.gov/account/) 
