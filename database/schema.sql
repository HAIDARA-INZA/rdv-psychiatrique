-- Schéma de la plateforme de rendez-vous (à exécuter sur une installation Laravel neuve)
SET NAMES utf8mb4;

ALTER TABLE users
  MODIFY email VARCHAR(255) NULL,
  ADD COLUMN phone VARCHAR(20) NULL UNIQUE AFTER email,
  ADD COLUMN role ENUM('patient','secretary','doctor','admin') NOT NULL DEFAULT 'patient' AFTER phone;

CREATE TABLE api_tokens (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  token_hash CHAR(64) NOT NULL UNIQUE,
  created_at DATETIME NOT NULL,
  expires_at DATETIME NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE services (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  description VARCHAR(255) NULL,
  duration_min SMALLINT UNSIGNED NOT NULL DEFAULT 30,
  price_fcfa INT UNSIGNED NOT NULL DEFAULT 0,
  active TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE practitioners (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED NULL,
  full_name VARCHAR(120) NOT NULL,
  title VARCHAR(80) NOT NULL,
  service_id BIGINT UNSIGNED NOT NULL,
  active TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
  FOREIGN KEY (service_id) REFERENCES services(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE availabilities (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  practitioner_id BIGINT UNSIGNED NOT NULL,
  weekday TINYINT UNSIGNED NOT NULL COMMENT '1=lundi ... 7=dimanche',
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  FOREIGN KEY (practitioner_id) REFERENCES practitioners(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE appointments (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  patient_id BIGINT UNSIGNED NOT NULL,
  practitioner_id BIGINT UNSIGNED NOT NULL,
  service_id BIGINT UNSIGNED NOT NULL,
  starts_at DATETIME NOT NULL,
  ends_at DATETIME NOT NULL,
  status ENUM('pending','confirmed','cancelled','done','no_show') NOT NULL DEFAULT 'confirmed',
  reason VARCHAR(255) NULL,
  slot_lock VARCHAR(40) NULL UNIQUE COMMENT 'anti double réservation, NULL si annulé',
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
  FOREIGN KEY (patient_id) REFERENCES users(id),
  FOREIGN KEY (practitioner_id) REFERENCES practitioners(id),
  FOREIGN KEY (service_id) REFERENCES services(id),
  INDEX idx_start (starts_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE audit_log (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED NULL,
  action VARCHAR(80) NOT NULL,
  details VARCHAR(255) NULL,
  ip VARCHAR(45) NULL,
  created_at TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Données fictives
INSERT INTO services (name, description, duration_min, price_fcfa) VALUES
('Consultation psychiatrie générale', 'Première consultation et suivi', 30, 5000),
('Psychologie clinique', 'Entretien et accompagnement psychologique', 45, 5000),
('Pédopsychiatrie', 'Enfants et adolescents', 45, 5000),
('Addictologie', 'Prise en charge des addictions', 30, 5000);

INSERT INTO practitioners (full_name, title, service_id) VALUES
('Dr Kouassi Aya', 'Psychiatre', 1),
('Dr Traoré Ibrahim', 'Psychiatre', 1),
('Mme Koné Fatoumata', 'Psychologue clinicienne', 2),
('Dr Yao Marie-Claire', 'Pédopsychiatre', 3),
('Dr Diallo Seydou', 'Addictologue', 4);

INSERT INTO availabilities (practitioner_id, weekday, start_time, end_time)
SELECT p.id, d.n, t.s, t.e
FROM practitioners p
JOIN (SELECT 1 n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) d
JOIN (SELECT '08:00:00' s, '12:00:00' e UNION SELECT '14:00:00', '17:00:00') t;
