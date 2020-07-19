from scipy import stats
import numpy as np
import sys

def compute(threshold, *args):
    vals = np.array(list(map(float, args)))
    # Remove outliers using z-score with the threshold passed by command-line arg.
    filtered = vals
    outliers = np.array([])

    if not np.all(vals[0] == vals):
        z = np.abs(stats.zscore(vals))
        filtered = vals[np.where(z < threshold)]
        outliers = vals[np.where(z >= threshold)]

    return {
        "mean": round(np.mean(filtered), 3),
        "median": round(np.median(filtered), 3),
        "std": round(np.std(filtered), 3),
        "outliers": outliers.size
    }
