#!/usr/bin/env python3

import math
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

sns.set()
palette = ["#2c2c2c", "#747474"]

data = pd.read_csv("results/exec_time.csv", skipinitialspace=True)

#  measure = "Median"
measure = "Mean"
# CSV data is in nanoseconds, so we first transform it to microseconds:
data[measure] = data[measure] / 1000
data.loc[data["Type"] == "lif", "Type"] = "This paper"
data.loc[data["Type"] == "lif-opt", "Type"] = "This paper (opt)"
data.loc[data["Type"] == "orig", "Type"] = "Orig"
data.loc[data["Type"] == "orig-opt", "Type"] = "Orig (opt)"

# First: plot running time (median):
# Measure 1: a[i] == b[i]
input1 = data[(data["Src"] == "measure1") &
              ~data["Type"].isin(["meng", "meng-opt"])]
input1_raw = input1[input1["Type"].isin(["Orig", "This paper"])]
input1_opt = input1[input1["Type"].isin(["Orig (opt)", "This paper (opt)"])]

# Measure 2: a[0] != b[0]
input2 = data[(data["Src"] == "measure2") &
              ~data["Type"].isin(["meng", "meng-opt"])]
input2_raw = input2[input2["Type"].isin(["Orig", "This paper"])]
input2_opt = input2[input2["Type"].isin(["Orig (opt)", "This paper (opt)"])]

fig = plt.figure()
ax1 = fig.add_subplot(221) # Input 1; non-optimized
ax2 = fig.add_subplot(222) # Input 2; non-optimized
ax3 = fig.add_subplot(223) # Input 1; optimized
ax4 = fig.add_subplot(224) # Input 2; optimized
fig.subplots_adjust(hspace=0.25, wspace=0.05)

sns.scatterplot(
    x="N", y=measure, hue="Type",
    style="Type", data=input1_raw,
    ax=ax1, palette=palette
)

ymin = math.floor(
    min(np.min(input1_raw[measure]), 
        np.min(input2_raw[measure]))
    * 100) / 100.0
ymax = math.ceil(
    max(np.max(input1_raw[measure]), 
        np.max(input2_raw[measure]))
    * 100) / 100.0

# Adjust the limits in order to make the data fit in the chart.
ystep = (ymax - ymin) / 4

step = 256
ax1.set(
    xlim=(0, 1024 + step/4), ylim=(ymin - ystep, ymax + 2*ystep),
    xticks=np.arange(0, 1024 + step, step),
    yticks=np.linspace(ymin, ymax, 4).round(decimals=2)
)
ax1.set_xticklabels([])
ax1.set_xlabel("(a) a[i] == b[i]", fontweight="bold")
ax1.yaxis.label.set_visible(False)
handles, labels = ax1.get_legend_handles_labels()
ax1.legend(loc="upper left", handles=handles, labels=labels)

sns.scatterplot(
    x="N", y=measure, hue="Type",
    style="Type", data=input2_raw,
    ax=ax2, palette=palette
)

ax2.set(xlim=(0, 1024 + step/4), xticks=np.arange(0, 1024 + step, step))
ax2.set_xticklabels([])
ax2.set(ylim=ax1.get_ylim(), yticks=ax1.get_yticks())
ax2.set_yticklabels([])
ax2.set_xlabel("(b) a[0] != b[0]", fontweight="bold")
ax2.yaxis.label.set_visible(False)
handles, labels = ax2.get_legend_handles_labels()
ax2.legend(loc="upper left", handles=handles, labels=labels)

sns.scatterplot(
    x="N", y=measure, hue="Type",
    style="Type", data=input1_opt,
    ax=ax3, palette=palette
)

ymin = math.floor(
    min(np.min(input1_opt[measure]), 
        np.min(input2_opt[measure]))
    * 100) / 100.0
ymax = math.ceil(
    max(np.max(input1_opt[measure]), 
        np.max(input2_opt[measure]))
    * 100) / 100.0

# Adjust the limits in order to make the data fit in the chart.
ystep = (ymax - ymin) / 4

ax3.set(
    xlim=(0, 1024 + step/4), 
    xticks=np.arange(0, 1024 + step, step))
ax3.set(
    ylim=(ymin - ystep, ymax + 4*ystep), 
    yticks=np.linspace(ymin, ymax,4).round(decimals=2))
ax3.xaxis.label.set_visible(False)
ax3.yaxis.label.set_visible(False)
handles, labels = ax3.get_legend_handles_labels()
ax3.legend(loc="upper left", handles=handles, labels=labels)

sns.scatterplot(
    x="N", y=measure, hue="Type",
    style="Type", data=input2_opt,
    ax=ax4, palette=palette
)

ax4.set(xlim=(0, 1024 + step/4), xticks=np.arange(0, 1024 + step, step))
ax4.set(ylim=ax3.get_ylim(), yticks=ax3.get_yticks())
ax4.set_yticklabels([])
ax4.xaxis.label.set_visible(False)
ax4.yaxis.label.set_visible(False)
handles, labels = ax4.get_legend_handles_labels()
ax4.legend(loc="upper left", handles=handles, labels=labels)

# Add common labels:
fig.text(
    0.5, 0.02,
    "# of cells of input arrays",
    ha="center", va="center",
    fontsize="large"
)
fig.text(
    0.02, 0.5, "{} of program running time (μs)".format(measure),
    ha="center", va="center", rotation="vertical", fontsize="large"
)

# Move both legends to the same position:
#  ax1.legend(loc="upper left")
#  ax2.legend(loc="upper left")

# Finally, save the figure:
fig.savefig("results/exec_time.pdf", bbox_inches="tight")

# Now, we plot the program size (in terms of llvm-ir instructions).
# In this case, the size is the same regardless of the inputs, so we only
# plot for input1.
data = pd.read_csv("results/size.csv", skipinitialspace=True)
# Mask "lif" as "this paper", for double-bind submissions.
data.loc[data["Type"] == "lif", "Type"] = "This paper"
data.loc[data["Type"] == "lif-opt", "Type"] = "This paper (opt)"
data.loc[data["Type"] == "orig", "Type"] = "Orig"
data.loc[data["Type"] == "orig-opt", "Type"] = "Orig (opt)"

data_raw = data[data["Type"].isin(["Orig", "This paper"])]
data_opt = data[data["Type"].isin(["Orig (opt)", "This paper (opt)"])]

fig = plt.figure(figsize=(6, 4))
ax1 = fig.add_subplot(121) # Non-optimized
ax2 = fig.add_subplot(122) # Optimized
fig.subplots_adjust(wspace=0.05)

sns.scatterplot(
    x="N", y="#LLVM-IR Instructions", hue="Type",
    style="Type", data=data_raw,
    ax=ax1, palette=palette
)

ax1.set(xlim=(0, 1024 + step/4), xticks=np.arange(0, 1024 + step, step))
ax1.set_yscale("log", base=10)
ax1.xaxis.label.set_visible(False)
ax1.set_ylabel("# of LLVM-IR instructions", fontsize="large")
handles, labels = ax1.get_legend_handles_labels()
ax1.legend(loc="lower right", handles=handles, labels=labels)

sns.scatterplot(
    x="N", y="#LLVM-IR Instructions", hue="Type",
    style="Type", data=data_opt,
    ax=ax2, palette=palette
)

ax2.set(xlim=(0, 1024 + step/4), xticks=np.arange(0, 1024 + step, step))
ax2.set_yscale("log", base=10)
ax2.set_yticklabels([])
ax2.xaxis.label.set_visible(False)
ax2.yaxis.label.set_visible(False)
handles, labels = ax2.get_legend_handles_labels()
ax2.legend(loc="lower right", handles=handles, labels=labels)

# Add common labels:
fig.text(
    0.5, 0.01,
    "# of cells of input arrays",
    ha="center", va="center",
    fontsize="large"
)

fig.savefig("results/size.pdf", bbox_inches="tight")

# Finally, we plot the time (user+system) spent on running the isochronous pass,
# for each size N.
fig = plt.figure(figsize=(5, 2))

data = pd.read_csv("results/pass_time.csv", skipinitialspace=True)
# Mask "lif" as "this paper", for double-bind submissions.
data.loc[data["Type"] == "lif", "Type"] = "This paper"
data.loc[data["Type"] == "meng", "Type"] = "Meng"

ax = sns.scatterplot(
    x="N", y=measure,
    hue="Type", style="Type",
    data=data, palette=palette
)

ax.set(
    xlim=(0, 1024 + step/4), xticks=np.arange(0, 1024 + step, step),
    xlabel="# of cells of input arrays",
    ylabel="{} of transformation\nrunning time (s)".format(measure)
)

handles, labels = ax.get_legend_handles_labels()
ax.legend(loc="best", handles=handles, labels=labels)

fig.savefig("results/pass_time.pdf", bbox_inches="tight")
