import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

df1 = pd.read_csv('counts.tsv', sep='\t')

df2 = pd.read_csv('SGB5935_metadata.tsv', sep='\t')

df_all = pd.merge(df1, df2, on='magID')
df_all = df_all.sort_values(by='study_group', ascending=False)
print(df_all)

IDs = []
hyp = []
CDS = []
grp = []

for i in range(len(df_all)):
    row = df_all.iloc[i]
    current = row['counts']
    current = current.replace('[','')
    current = current.replace(']','')
    current = current.replace("'",'')
    current = current.replace(" ", "")
    current = current.split(',')
    for j in range(len(current)):
        current[j] = int(current[j])
    hyp.append(current[0])
    CDS.append(current[1])
    grp.append(row['study_group'])
    IDs.append(row['magID'])

# rgb(49,135,109) #31876d HEALTHY
# rgb(45,123,164) #2d7ba4 MUCOSITIS
# rgb(191,108,46) #bf6c2e PERIIMPLANTIS
col = []
for i in range(len(grp)):
    if grp[i] == 'healthy':
        col.append('#31876D')
    elif grp[i] == 'mucositis':
        col.append('#2D7BA4')
    else:
        col.append('#BF6C2E')

d = {"ID":IDs, "hyp":hyp, "CDS":CDS, "grp":grp, "col":col}
df = pd.DataFrame(d)
print(df)


sns.set_theme(style="whitegrid")

g = plt.subplots()

g = sns.barplot(data=df, x='ID', y='CDS', hue='grp', dodge=False)

g = sns.barplot(data=df, x='ID', y='hyp', hue='grp', dodge=False, palette='dark')

g.set_xticklabels(rotation=90, fontsize=7, labels=df['ID'])
g.set(xlabel=None)
g.set(ylabel='counts')
sns.move_legend(
    g, "lower center",
    bbox_to_anchor=(.5, 1), ncol=2, title=None, frameon=False)

plt.show()
