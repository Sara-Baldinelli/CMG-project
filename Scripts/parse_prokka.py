import os
import subprocess
import pandas as pd

def run_cat_command(folder):
    os.chdir(folder)
    cmd1 = 'cat *.tsv | grep "hypothetical" | wc --lines'
    cmd2 = 'cat *.tsv | grep "CDS" | wc --lines'
    out_hp = subprocess.check_output(cmd1, shell=True)
    output_lines_hp = out_hp.decode('utf-8').splitlines()
    out_CD = subprocess.check_output(cmd2, shell=True)
    output_lines_CD = out_CD.decode('utf-8').splitlines()

    current_sample = os.path.basename(folder)
    return current_sample, output_lines_hp[0], output_lines_CD[0]

root_folder = '' #/home/roans77/Computational Genomics/PROJECT/prokka_output
DATA = {}
for subdir, _, _ in os.walk(root_folder):
    print(f"Parsing folder: {subdir}")
    k, v1, v2 = run_cat_command(subdir)
    DATA[k] = [v1, v2]

del DATA['prokka_output']
print(DATA, len(DATA))

df1 = pd.DataFrame(DATA.items(), columns=['magID', 'counts'])

print(df1)

df1.to_csv("counts.tsv", sep='\t')
