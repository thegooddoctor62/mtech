# Project: Sorting Marks of Students (ARM Assembly)

This project demonstrates **two different ARM Assembly approaches** to sort student marks based on total scores. Both methods were implemented and tested using **Keil µVision**.

---

## 📂 Project Contents
- `rank_assembly.uvprojx` → Keil µVision project file.
- `ranklist.s` → First logic for calculating totals and sorting marks.
- `ranklist2.s` → Alternative logic for sorting and data arrangement.

---

## 🛠 Tools & Environment
- **Assembler:** ARM ASM
- **IDE:** Keil µVision
- **Target:** ARM Cortex-M (STM32 compatible)

---

## 🔍 Problem Statement
Sort the marks of **three students**, each with **three subjects**, in descending order based on their total marks. Display the rank list with student IDs and total marks.

---

## 📑 Logic Overview

### ✅ Logic 1 (`ranklist.s`)
- Stores student IDs and marks in memory sequentially.
- Computes totals using a loop.
- Sorts totals using **comparison and swapping**.
- Outputs rank list with associated student IDs.

### ✅ Logic 2 (`ranklist2.s`)
- Sequentially sums each student's marks without loops.
- Sorts using a similar comparison mechanism.
- Outputs rank list with explicit student ID insertion during storage.

---

## ▶ How to Run
1. Open the `rank_assembly.uvprojx` file in **Keil µVision**.
2. Select the target device (e.g., ARM Cortex-M4).
3. Build the project .
4. Load into simulator or hardware.
5. Check the **Memory Window** for the sorted rank list.

---

## 🧪 Expected Output
Students are ranked in **descending order of total marks**, along with their respective IDs and marks.

