import pandas as pd

data = {
    "Student": [
        "S01",
        "S02",
        "S03",
        "S04",
        "S05",
        "S06",
        "S07",
        "S08",
        "S09",
        "S10",
        "S11",
        "S12",
        "S13",
        "S14",
        "S15",
        "S15",
    ],
    "Sleep_Hours": [7, 5, 9, 8, 6, 4, 7, 9, 5, 12, 8, 6, 7, 5, 7, 7],
    "Concentration_Score": [
        80,
        70,
        95,
        85,
        75,
        62,
        80,
        95,
        70,
        75,
        85,
        75,
        80,
        70,
        80,
        80,
    ],
}

df = pd.DataFrame(data)

print("=== 1. INSPECT DATASET ===")

duplicates = df[df.duplicated()]
print("Duplicate Records:")
print(duplicates)

df_clean = df.drop_duplicates().reset_index(drop=True)

print("\nSummary Statistics:")
print(df_clean[["Sleep_Hours", "Concentration_Score"]].describe())

r_original = df_clean["Sleep_Hours"].corr(
    df_clean["Concentration_Score"], method="pearson"
)

print(f"\n=== 2 & 3. UNNORMALIZED CORRELATION ===")
print(f"Pearson Correlation (Original): {r_original:.4f}")

df_normalized = df_clean.copy()

for col in ["Sleep_Hours", "Concentration_Score"]:
    df_normalized[col] = (df_clean[col] - df_clean[col].min()) / (
        df_clean[col].max() - df_clean[col].min()
    )

print("\n=== 4. NORMALIZED DATASET ===")
print(df_normalized)

r_normalized = df_normalized["Sleep_Hours"].corr(
    df_normalized["Concentration_Score"], method="pearson"
)

print(f"\nPearson Correlation (Normalized): {r_normalized:.4f}")

print("\n=== CONCLUSION ===")
print(f"Original Pearson r:   {r_original:.4f}")
print(f"Normalized Pearson r: {r_normalized:.4f}")
print(
    "Explanation: Min-Max normalization scales the values to a range of 0 to 1 while keeping their original relationships. "
    "This means the strength and direction of the Pearson correlation stay the same."
)