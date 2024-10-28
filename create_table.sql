-- Создание таблицы самолетов
CREATE TABLE airplanes (
    id SERIAL PRIMARY KEY,                -- Уникальный идентификатор самолета
    model_number VARCHAR(50) NOT NULL,    -- Номер модели самолета
    registration_number VARCHAR(50) UNIQUE NOT NULL, -- Уникальный регистрационный номер самолета
    capacity INT NOT NULL                 -- Количество мест для пассажиров
);

-- Создание таблицы рейсов
CREATE TABLE flights (
    id SERIAL PRIMARY KEY,                -- Уникальный идентификатор рейса
    flight_number VARCHAR(20) UNIQUE NOT NULL, -- Уникальный номер рейса
    departure_airport VARCHAR(50) NOT NULL, -- Аэропорт вылета
    arrival_airport VARCHAR(50) NOT NULL,  -- Аэропорт назначения
    departure_datetime TIMESTAMP NOT NULL, -- Дата и время вылета
    arrival_datetime TIMESTAMP NOT NULL,   -- Дата и время прибытия
    airplane_id INT NOT NULL,              -- ID самолета, выполняющего рейс
    FOREIGN KEY (airplane_id) REFERENCES airplanes(id) ON DELETE CASCADE
);

-- Создание таблицы пассажиров
CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,                -- Уникальный идентификатор пассажира
    first_name VARCHAR(50) NOT NULL,      -- Имя пассажира
    last_name VARCHAR(50) NOT NULL,       -- Фамилия пассажира
    email VARCHAR(100) UNIQUE NOT NULL    -- Уникальный адрес электронной почты пассажира
);

-- Создание таблицы бронирований
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,                -- Уникальный идентификатор бронирования
    flight_id INT NOT NULL,               -- ID рейса
    passenger_id INT NOT NULL,            -- ID пассажира
    seat_number VARCHAR(10) NOT NULL,     -- Номер места
    FOREIGN KEY (flight_id) REFERENCES flights(id) ON DELETE CASCADE,
    FOREIGN KEY (passenger_id) REFERENCES passengers(id) ON DELETE CASCADE
);
