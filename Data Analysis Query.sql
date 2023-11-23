SELECT * FROM VideoGames;

--1. Hitung total penjualan global untuk setiap publisher menggunakan SQL.

SELECT
    Publisher,
    SUM(Global_Sales) AS [Total Penjualan Global Sales]
FROM VideoGames
GROUP BY Publisher
ORDER BY [Total Penjualan Global Sales] DESC;

--2. Buat query SQL yang membandingkan total penjualan di Amerika Utara, Eropa, dan Jepang untuk setiap platform.
SELECT
    Platform,
    SUM(NA_Sales) AS [Total Penjualan Amerika Utara],
    SUM(EU_Sales) AS [Total Penjualan Eropa],
    SUM(JP_Sales) AS [Total Penjualan Jepang]
FROM VideoGames
GROUP BY Platform;

--3. Gunakan SQL untuk menganalisis total penjualan global pada tahun tertentu.
SELECT
    Year,
    SUM(Global_Sales) AS [Total Penjualan Global]
FROM VideoGames
GROUP BY Year
ORDER BY Year ASC;

--4. Temukan publisher dengan total penjualan tertinggi menggunakan SQL.
SELECT TOP 1
    Publisher,
    SUM(Global_Sales) AS [Total Penjualan Global]
FROM VideoGames
GROUP BY Publisher
ORDER BY [Total Penjualan Global] DESC;

--5. Hitung total penjualan global untuk masing-masing dekade terakhir menggunakan SQL.
SELECT TOP 10
    Year,
    SUM(NA_Sales) AS [Total Penjualan Amerika Utara],
    SUM(EU_Sales) AS [Total Penjualan Eropa],
    SUM(JP_Sales) AS [Total Penjualan Jepang],
    SUM(Other_Sales) AS [Total Penjualan Other Sales],
    SUM(Global_Sales) AS [Total Penjualan Global Sales]
FROM VideoGames
GROUP BY Year
ORDER BY Year DESC;

--6. Buat query SQL untuk menentukan platform yang paling populer untuk setiap genre.
WITH CTE AS (
    SELECT
        Platform,
        Genre,
        COUNT(*) AS [Total Games Di Tiap Genre],
        ROW_NUMBER() OVER(PARTITION BY Platform ORDER BY COUNT(*) DESC) AS rownum
    FROM VideoGames
    GROUP BY Platform,Genre
    
)
SELECT
    Platform,
    Genre,
    [Total Games Di Tiap Genre]
FROM CTE
WHERE rownum = 1
ORDER BY Platform;

--7. Gunakan SQL untuk menganalisis tren penjualan global untuk setiap genre.
SELECT
    Genre,
    SUM(Global_Sales) AS [Total Penjualan Global]
FROM VideoGames
GROUP BY Genre
ORDER BY Genre ASC;

--8. Analisis apakah tahun rilis memiliki pengaruh pada total penjualan menggunakan SQL.
SELECT
    Year,
    SUM(NA_Sales) AS [Total Penjualan Amerika Utara],
    SUM(EU_Sales) AS [Total Penjualan Eropa],
    SUM(JP_Sales) AS [Total Penjualan Jepang],
    SUM(Other_Sales) AS [Total Penjualan Other Sales],
    SUM(Global_Sales) AS [Total Penjualan Global]
FROM VideoGames
GROUP BY Year 
ORDER BY Year ASC;

--9. Temukan game terlaris dalam setiap genre menggunakan SQL.
WITH CTE AS (
SELECT
    Genre,
    Name,
    COUNT(Name) AS [Total Games],
    ROW_NUMBER() OVER(PARTITION BY Genre ORDER BY COUNT(Name) DESC) AS rownum
FROM VideoGames
GROUP BY Genre,Name
)

SELECT
    Genre,
    Name,
    [Total Games]
FROM CTE
WHERE rownum = 1
ORDER BY [Total Games] DESC;

--10. Gunakan SQL untuk menganalisis total penjualan global untuk masing-masing genre.
SELECT
    Genre,
    SUM(Global_Sales) AS [Total Penjualan Global]
FROM VideoGames
GROUP BY Genre
ORDER BY [Total Penjualan Global] DESC;