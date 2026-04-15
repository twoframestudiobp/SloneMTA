<?php
// SloneMTA Minimal PHP Backend
// Connects to MySQL/MariaDB

header('Content-Type: application/json');

$host = 'localhost';
$db   = 'slonemta';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
     $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
     echo json_encode(['error' => 'Database connection failed']);
     exit;
}

// Simple Router
$action = $_GET['action'] ?? '';

switch($action) {
    case 'stats':
        echo json_encode([
            'online' => true,
            'players' => 42,
            'maxPlayers' => 100
        ]);
        break;
    
    case 'news':
        $stmt = $pdo->query('SELECT * FROM news ORDER BY created_at DESC LIMIT 5');
        echo json_encode($stmt->fetchAll());
        break;

    default:
        echo json_encode(['status' => 'SloneMTA API is active']);
        break;
}
?>
