# BioBash
![](web/bash_logo.png) 

Official repository for the BioBash project development.

## About BioBash
This project is aimed to develope a Bioinformatics library for common tasks in the field of Computational Biology (mainly Bioinformatics) using the BASH language.
It is leaded by Andrés M. Pinzón, full time professor at Bioinformatics and Systems Biology Laboratory[Bioinformatics and Systems Biology Laboratory](https://gibbslab.github.io/) , Institute for Genetics[Institute for Genetics](https://genetica.unal.edu.co/)  - National University of Colombia[National University of Colombia](http://unal.edu.co/)  in south America. 

## Why BioBash?
Basically this library has been around for several years in our laboratory, as a bunch of routines I programmed for common bioinformatics tasks such as dealing with FASTA headers and FQ files, as well as with manipulation of lists of genes etc.
After the years of using this BioBash two things became clear. **First** it was really useful and **second**, I found myself re-inventing the wheel  (in BASH!).
So, since there are hundreds of useful and optimized bioinformatics tools, why create something like BioBash? Well there are two answers. **First**, not everything has been already done in Bioinformatics, and there is room for a couple of things. **Second**, I found myself , students and  colleagues adapting to the way different tools manipulate files, inputs and outputs, so there was a learning curve in every single tool.

### A matter of consistency and efficiency
So one of the main aims of BioBash is to have a consistent interface for common analysis in the field, without re-inventing the wheel and in a common ambient for Computational Biologists (e.i. BASH). 
In this regard, on one hand BioBash is a wrapper for several pre-existent bioinformatics tools, such as clustalw, seqtk, BWA, Bowtie, EMBOSS, NCBI-BLAST etc, with a consistent interface for all of them. On the other hand it also provides brand new routines for file manipulation and other Bioinformatics-related tasks common in the field (dealing with lists anyone?), and for that regard uses core utils that come with any installation of BASH.

For example, if you have a list of genes in a text file and you want to know how many of these are unique genes, and how many are over-represented in the list, one way is to use common core BASH commands such as sort and unique, to obtain that information, OR use the BioBash "bb_get_nr_list" command and forget about all the command line options needed for each program.}
Another example, if you have two multiple  FASTA files, and you want to BLAST one to each other and see how they match, you can use NCBI-BLAST's formatdb command, create the database, and then use blastp or blastn (or any other variant), perform the alignment (with all the options necessary) and obtain your results. OR you can use the bb_blast_seqs commmand from BioBash and then go for a cup of coffee, and let BioBash deal with routes, temporary files, re-naming, threading  etc.

So I believe BioBash can make you more efficient through a consistent interface, all commands in BioBash behave, respond and output  in a similar way, no matter what is happening behind scenes.
 













