#!/usr/bin/env python3
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

sns.set()
palette = ["#2c2c2c", "#747474", "#b4b4b4"]

# List of benchmarks that meng's tool failed to transform or produced wrong
# code.
failed = [
    "hash/md5",
    "dudect/aes32",
    "dudect/donnabad",
    "applied-crypto/loki91"
]
crashed = [
    "hash/md5",
    "dudect/aes32",
    "dudect/donnabad",
]

# First: program sizes.
data = pd.read_csv("size.csv", skipinitialspace=True)
# Mask "lif" as "this paper", for double-bind submissions.
data.loc[data["Type"] == "lif", "Type"] = "This paper"
data.loc[data["Type"] == "lif-opt", "Type"] = "This paper (opt)"
data.loc[data["Type"] == "orig", "Type"] = "Orig"
data.loc[data["Type"] == "orig-opt", "Type"] = "Orig (opt)"
data.loc[data["Type"] == "meng", "Type"] = "Meng"
data.loc[data["Type"] == "meng-opt", "Type"] = "Meng (opt)"

data_raw = data[data["Type"].isin(["Orig", "This paper", "Meng"])]
data_opt = data[data["Type"].isin(["Orig (opt)", "This paper (opt)", "Meng (opt)"])]

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

fig.savefig("size.pdf", bbox_inches="tight")

# Now, running time of the pass:
#  measure = "Median"
measure = "Mean"
data = pd.read_csv("pass_time.csv", skipinitialspace=True)
# Mask "lif" as "this paper", for double-bind submissions.
data.loc[data["Type"] == "lif", "Type"] = "This paper"
data.loc[data["Type"] == "meng", "Type"] = "Meng"

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
fig.savefig("pass_time.pdf", bbox_inches="tight")

# Finally, benchmarks running time.
data = pd.read_csv("exec_time.csv", skipinitialspace=True)
# CSV data is in nanoseconds, so we first transform it to microseconds:
data[measure] = data[measure] / 1000
# Mask "lif" as "this paper", for double-bind submissions.
data.loc[data["Type"] == "lif", "Type"] = "This paper"
data.loc[data["Type"] == "lif-opt", "Type"] = "This paper (opt)"
data.loc[data["Type"] == "orig", "Type"] = "Orig"
data.loc[data["Type"] == "orig-opt", "Type"] = "Orig (opt)"
data.loc[data["Type"] == "meng", "Type"] = "Meng"
data.loc[data["Type"] == "meng-opt", "Type"] = "Meng (opt)"

data_raw = data[data["Type"].isin(["Orig", "This paper", "Meng"])]
data_opt = data[data["Type"].isin(["Orig (opt)", "This paper (opt)", "Meng (opt)"])]

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

fig.savefig("exec_time.pdf", bbox_inches="tight")
