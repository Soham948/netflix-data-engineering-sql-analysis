# Netflix Content Strategy & Data Engineering Project

## 📌 Project Overview
This project demonstrates a complete data lifecycle: from raw data ingestion and cleaning to database migration and advanced SQL analytics. Using a dataset of Netflix movies and TV shows, this pipeline provides actionable insights into content trends, directorial impact, and regional production growth.

## 🛠️ Tech Stack
*   **Language:** Python 3.x
*   **Data Manipulation:** Pandas, NumPy
*   **Database:** PostgreSQL
*   **ETL/Connection:** SQLAlchemy, Psycopg2
*   **Visualization:** Matplotlib, Seaborn
*   **Query Language:** PostgreSQL (Advanced SQL)

## 📂 Dataset
The project utilizes the `netflix_titles.csv` file, which contains details of movies and TV shows available on Netflix as of 2021. Key columns include:
*   `show_id`, `type`, `title`, `director`, `cast`, `country`, `date_added`, `release_year`, `rating`, `duration`, `listed_in`, and `description`.

## 🚀 Pipeline Workflow

### 1. Data Cleaning & Exploration (Python)
*   Loaded raw data using **Pandas**.
*   Performed initial EDA (`df.info()`, `df.describe()`).
*   Handled missing values in critical columns like `director`, `cast`, and `country`.
*   Verified data integrity by checking for duplicates.

### 2. ETL Process (Extract, Transform, Load)
*   Established a connection to a local PostgreSQL instance using **SQLAlchemy**.
*   Automated the schema creation and data loading process using `df.to_sql()`, enabling the transition from flat files to a structured relational database.

### 3. Business Logic & Analytics (SQL)
Executed 15 professional business problems to extract insights, including:
*   **Content Distribution:** Ratio of Movies vs. TV Shows.
*   **Global Footprint:** Identification of top content-producing countries.
*   **Production Insight:** Deep-dives into specific directors (e.g., Rajiv Chilaka) and actors (e.g., Salman Khan).
*   **Trend Analysis:** Tracking content growth over the last 5 years.
*   **Content Safety:** Sentiment-based categorization using description keyword analysis.

## 📊 Key Business Insights Solved
| Problem Category | Description |
| :--- | :--- |
| **Growth** | Identifying content added in the last 5 years. |
| **Regional** | Analyzing the average content release percentage for India. |
| **Categorization** | Labeling content as 'Safe' or 'Violence-related' based on metadata. |
| **Optimization** | Finding the longest movies and TV shows with multiple seasons. |

## ⚙️ How to Run
1.  **Clone the repo:** `git clone https://github.com/yourusername/repository-name.git`
2.  **Install dependencies:** `pip install pandas sqlalchemy psycopg2 matplotlib seaborn`
3.  **Setup Database:** Ensure PostgreSQL is running and create a database named `netflix_db`.
4.  **Run ETL:** Execute the Jupyter Notebook to clean and upload the data.
5.  **Run Analysis:** Execute the SQL script in your preferred SQL editor (pgAdmin/DBeaver).

## 🛡️ License
Distributed under the MIT License.
