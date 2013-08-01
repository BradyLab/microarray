import os
import commands
## Blast cdna name to probe file give a list of sequnce
## format > probe_name seq
## cdna > seq
### 


def create_fasta_file(probe_file):
    """take probe file and makes it into a fasta file"""
    for line in open(probe_file):
        arg = line.split(",")
        if arg[3] == "N/A":
            probe = arg[1]
            seq = arg[-2]
            probe_fasta = open("probes/{0}.fasta".format(probe),"wb")
            probe_fasta.write(">{0}\n".format(probe))
            probe_fasta.write("{0}\n".format(seq))
            probe_fasta.close()


def main(cdna):
    """take probe file and makes it into a fasta file"""
    probe_fasta = open("probe.fasta","wb")
    for probe_fasta in os.listdir("probes"):
        cmd = "blastall -p blastn -i probes/{0} -d {1} -m8 -o probes_out/{0}.out".format(probe_fasta,cdna)
        commands.getoutput(cmd)

def omain(outputs):
    """take probe file and makes it into a fasta file"""
    p = open("probe_names.txt",'wb')
    for out_fasta in os.listdir(outputs):
        fh = open("{0}/{1}".format(outputs,out_fasta))
        all_lines = fh.readlines()
        try:
            args = all_lines[0].split("\t")
            probe = args[0]
            gene = args[1]
            eva = float(args[-2])
            bitscore  = float(args[-1])
            p.write("{0}\t{1}\t{2}\t{3}\n".format(probe,gene,eva,bitscore))
        except IndexError: print out_fasta
    p.close()


## Blast2 seq
#def blast_wrapper(probe_fasta, cda_fasta)
#    for 
#blastall -i query -d nr -o blast.out 
#main("all.cdna")
omain("probes_out")
#create_fasta_file("Os vascular.csv")
