-- Memanggil seluruh data dari table VideoGames
SELECT * FROM VideoGames;

--Proses Pengecekan dan Cleaning DataBase

-- Menghitung jumlah baris pada tabel : 16327 rows
SELECT 
    COUNT(*) AS [Total Rows]
FROM VideoGames;

-- Menghitung jumlah kolom pada tabel : 11 Columns
SELECT COUNT(*) AS JumlahKolom FROM information_schema.columns WHERE table_name = 'VideoGames';


-- Mengecek tipe data seluruh kolom dalam suatu tabel
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'VideoGames';


-- Menghitung jumlah kolom pada tabel, jika tidak ada data yang ditampilkan artinya tidak ada data NULL
SELECT COUNT(*) AS JumlahKolom FROM information_schema.columns WHERE table_name = 'VideoGames';

-- Mengecek nilai null pada kolom tertentu, jika tidak ada data yang ditampilkan artinya tidak ada data NULL
SELECT * FROM VideoGames WHERE Rank IS NULL;

-- Mengecek nilai null pada kolom tertentu, jika tidak ada data yang ditampilkan artinya tidak ada data NULL
SELECT * FROM VideoGames WHERE Name IS NULL;

-- Mengecek nilai null pada kolom tertentu, jika tidak ada data yang ditampilkan artinya tidak ada data NULL
SELECT * FROM VideoGames WHERE Platform IS NULL;

-- Mengecek nilai null pada kolom tertentu, jika tidak ada data yang ditampilkan artinya tidak ada data NULL
SELECT * FROM VideoGames WHERE Year IS NULL;

-- Mengecek nilai null pada kolom tertentu, jika tidak ada data yang ditampilkan artinya tidak ada data NULL
SELECT * FROM VideoGames WHERE Genre IS NULL;

-- Mengecek nilai null pada kolom tertentu, jika tidak ada data yang ditampilkan artinya tidak ada data NULL
SELECT * FROM VideoGames WHERE Publisher IS NULL;

-- Mengecek nilai null pada kolom tertentu
SELECT * FROM VideoGames WHERE NA_Sales IS NULL;

-- Mengecek nilai null pada kolom tertentu, jika tidak ada data yang ditampilkan artinya tidak ada data NULL
SELECT * FROM VideoGames WHERE EU_Sales IS NULL;

-- Mengecek nilai null pada kolom tertentu, jika tidak ada data yang ditampilkan artinya tidak ada data NULL
SELECT * FROM VideoGames WHERE JP_Sales IS NULL;

-- Mengecek nilai null pada kolom tertentu, jika tidak ada data yang ditampilkan artinya tidak ada data NULL
SELECT * FROM VideoGames WHERE Other_Sales IS NULL;

-- Mengecek nilai null pada kolom tertentu, jika tidak ada data yang ditampilkan artinya tidak ada data NULL
SELECT * FROM VideoGames WHERE Global_Sales IS NULL;

--Mengecek Data Duplikat, Jika tidak ada data yang ditampilkan artinya tidak ada duplikat data
SELECT
    Rank,
    Name,
    Platform,
    Year,
    Genre,
    Publisher,
    NA_Sales,
    EU_Sales,
    JP_Sales,
    Other_Sales,
    Global_Sales
FROM VideoGames
GROUP BY
    Rank,
    Name,
    Platform,
    Year,
    Genre,
    Publisher,
    NA_Sales,
    EU_Sales,
    JP_Sales,
    Other_Sales,
    Global_Sales
HAVING COUNT(*) > 1;


