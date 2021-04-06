#!/usr/bin/env python3
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

sns.set()
palette = ["#2c2c2c", "#747474", "#b4b4b4"]

# List of benchmarks that wu's tool crashed (failed to transform).
crashed = [
    "hash/md5",
    "dudect/aes32",
    "dudect/donnabad",
]

# List of benchmarks that either crashed (right above) or that wu's tool
# somehow produced wrong code.
failed = crashed + ["applied-crypto/loki91"]

# First: program sizes.
data = pd.read_csv("results/size.csv", skipinitialspace=True)
data = data[data["Bench"] != "comp"]

# Ensure that crashed programs will not appear in the chart.
data.loc[
    data["Bench"].isin(failed) &
    data["Type"].str.startswith("wu"),
    "#LLVM-IR Instructions"
] = -1

# Mask "lif" as "this paper", for double-bind submissions.
data.loc[data["Type"] == "lif", "Type"] = "This paper"
data.loc[data["Type"] == "lif-opt", "Type"] = "This paper (opt)"
data.loc[data["Type"] == "orig", "Type"] = "Orig"
data.loc[data["Type"] == "orig-opt", "Type"] = "Orig (opt)"
data.loc[data["Type"] == "wu", "Type"] = "Wu"
data.loc[data["Type"] == "wu-opt", "Type"] = "Wu (opt)"

# Split unoptimized and optimized data.
data_raw = data[data["Type"].isin(["Orig", "This paper", "Wu"])]
data_opt = data[data["Type"].isin(["Orig (opt)", "This paper (opt)", "Wu (opt)"])]

fig = plt.figure(figsize=(9, 10))
ax1 = fig.add_subplot(211) # Non-optimized
ax2 = fig.add_subplot(212) # Optimized
fig.subplots_adjust(hspace=0.05)

sns.barplot(
    x="Bench", y="#LLVM-IR Instructions",
    hue="Type", data=data_raw,
    palette=palette, ax=ax1
)

ax1.xaxis.label.set_visible(False)
ax1.yaxis.label.set_visible(False)
ax1.set_yscale("log", base=10)
ax1.set_xticks([])
ax1.legend(loc="upper left", bbox_to_anchor=(0, 1), ncol=3, fontsize="large")

sns.barplot(
    x="Bench", y="#LLVM-IR Instructions",
    hue="Type", data=data_opt,
    palette=palette, ax=ax2
)

for tick in ax2.get_xticklabels():
    text = tick.get_text()
    if text in failed:
        tick.set_text("* {}".format(text))
    tick.set_fontsize("x-large")
for tick in ax1.get_yticklabels():
    tick.set_fontsize("x-large")

ax2.xaxis.label.set_visible(False)
ax2.yaxis.label.set_visible(False)
ax2.set_yscale("log", base=10)
ax2.set_xticklabels(
    ax2.get_xticklabels(),
    rotation=60,
    horizontalalignment="right"
)
ax2.legend(loc="upper left", bbox_to_anchor=(0, 1), ncol=3, fontsize="large")
for tick in ax2.get_yticklabels():
    tick.set_fontsize("x-large")

# Add common y-label:
fig.text(
    0.045, 0.5, "# of LLVM-IR instructions",
    ha="center", va="center", rotation="vertical",
    fontsize="x-large"
)

fig.savefig("results/size.pdf", bbox_inches="tight")

# Now, running time of the pass:
#  measure = "Median"
measure = "Mean"
data = pd.read_csv("results/pass_time.csv", skipinitialspace=True)
data = data[data["Bench"] != "comp"]

# Ensure that programs that failed will not appear in the chart.
data.loc[
    data["Bench"].isin(crashed) &
    data["Type"].str.startswith("wu"),
    measure
] = -1

# Mask "lif" as "this paper", for double-bind submissions.
data.loc[data["Type"] == "lif", "Type"] = "This paper"
data.loc[data["Type"] == "wu", "Type"] = "Wu"

fig = plt.figure(figsize=(8, 6))
ax1 = fig.add_subplot(111) # Non-optimized

sns.barplot(
    x="Bench", y=measure,
    hue="Type", data=data,
    palette=palette, ax=ax1
)

ax1.xaxis.label.set_visible(False)
ax1.set_ylabel(
    "{} of transformation running time (s)".format(measure),
    fontsize="large"
)
ax1.set_yscale("log", base=10)

for tick in ax1.get_xticklabels():
    text = tick.get_text()
    if text in crashed:
        tick.set_text("* {}".format(text))
    tick.set_fontsize("large")
for tick in ax1.get_yticklabels():
    tick.set_fontsize("large")

ax1.set_xticklabels(
    ax1.get_xticklabels(),
    rotation=60,
    horizontalalignment="right"
)

ax1.legend(loc="best", fontsize="large", title=None)
fig.savefig("results/pass_time.pdf", bbox_inches="tight")

# Finally, benchmarks running time.
data = pd.read_csv("results/exec_time.csv", skipinitialspace=True)
data = data[data["Bench"] != "comp"]

# CSV data is in nanoseconds, so we first transform it to microseconds:
data[measure] = data[measure] / 1000

# Ensure that programs that failed will not appear in the chart.
data.loc[
    data["Bench"].isin(failed) & 
    data["Type"].str.startswith("wu"),
    measure
] = -1

# Mask "lif" as "this paper", for double-bind submissions.
data.loc[data["Type"] == "lif", "Type"] = "This paper"
data.loc[data["Type"] == "lif-opt", "Type"] = "This paper (opt)"
data.loc[data["Type"] == "orig", "Type"] = "Orig"
data.loc[data["Type"] == "orig-opt", "Type"] = "Orig (opt)"
data.loc[data["Type"] == "wu", "Type"] = "Wu"
data.loc[data["Type"] == "wu-opt", "Type"] = "Wu (opt)"

data_raw = data[data["Type"].isin(["Orig", "This paper", "Wu"])]
data_opt = data[data["Type"].isin(["Orig (opt)", "This paper (opt)", "Wu (opt)"])]

fig = plt.figure(figsize=(8, 6))
ax1 = fig.add_subplot(211) # Non-optimized
ax2 = fig.add_subplot(212) # Optimized
fig.subplots_adjust(hspace=0.05)

sns.barplot(
    x="Bench", y=measure,
    hue="Type", data=data_raw,
    palette=palette, ax=ax1
)

ax1.xaxis.label.set_visible(False)
ax1.yaxis.label.set_visible(False)
ax1.set_yscale("log", base=10)
ax1.set_xticks([])
ax1.legend(loc="upper left", bbox_to_anchor=(.22, 1), ncol=3, fontsize="large")

sns.barplot(
    x="Bench", y=measure,
    hue="Type", data=data_opt,
    palette=palette, ax=ax2
)

for tick in ax2.get_xticklabels():
    text = tick.get_text()
    if text in failed:
        tick.set_text("* {}".format(text))
    tick.set_fontsize("large")
for tick in ax1.get_yticklabels():
    tick.set_fontsize("large")

ax2.xaxis.label.set_visible(False)
ax2.yaxis.label.set_visible(False)
ax2.set_yscale("log", base=10)
ax2.set_xticklabels(
    ax2.get_xticklabels(),
    rotation=60,
    horizontalalignment="right"
)
ax2.legend(loc="upper left", bbox_to_anchor=(.22, 1), ncol=2, fontsize="large")
# Add common y-label:
fig.text(
    0.05, 0.5, "{} of program running time (μs)".format(measure),
    ha="center", va="center", rotation="vertical",
    fontsize="large"
)

fig.savefig("results/exec_time.pdf", bbox_inches="tight")
