-- Создание таблицы для самолётов
CREATE TABLE Airplanes (
    registration_number VARCHAR(50) PRIMARY KEY,  -- Уникальный регистрационный номер самолета
    model_number VARCHAR(50) NOT NULL,            -- Номер модели самолета
    capacity INT NOT NULL                         -- Вместимость самолета (количество мест для пассажиров)
);

-- Создание таблицы для рейсов
CREATE TABLE Flights (
    flight_number VARCHAR(20) PRIMARY KEY,       -- Уникальный номер рейса
    departure_airport VARCHAR(50) NOT NULL,      -- Аэропорт вылета
    arrival_airport VARCHAR(50) NOT NULL,        -- Аэропорт назначения
    departure_datetime TIMESTAMP NOT NULL,       -- Дата и время вылета
    arrival_datetime TIMESTAMP NOT NULL,         -- Дата и время прибытия
    airplane_reg_number VARCHAR(50) NOT NULL,    -- Внешний ключ: регистрационный номер самолета, выполняющего рейс
    FOREIGN KEY (airplane_reg_number) REFERENCES Airplanes(registration_number) ON DELETE CASCADE
);

-- Создание таблицы для пассажиров
CREATE TABLE Passengers (
    email VARCHAR(100) PRIMARY KEY,              -- Уникальный адрес электронной почты пассажира
    first_name VARCHAR(50) NOT NULL,             -- Имя пассажира
    last_name VARCHAR(50) NOT NULL               -- Фамилия пассажира
);

-- Создание таблицы для бронирований
CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,               -- Уникальный идентификатор бронирования
    flight_number VARCHAR(20) NOT NULL,          -- Внешний ключ: номер рейса
    passenger_email VARCHAR(100) NOT NULL,       -- Внешний ключ: email пассажира
    seat_number VARCHAR(10) NOT NULL,            -- Номер места, которое забронировал пассажир
    FOREIGN KEY (flight_number) REFERENCES Flights(flight_number) ON DELETE CASCADE,
    FOREIGN KEY (passenger_email) REFERENCES Passengers(email) ON DELETE CASCADE
);