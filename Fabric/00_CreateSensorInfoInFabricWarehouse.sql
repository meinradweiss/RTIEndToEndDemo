--DROP TABLE SensorInfo 

CREATE TABLE SensorInfo
(sensorId  VARCHAR(25) NOT NULL
,brand     VARCHAR(25) NOT NULL
,equipment VARCHAR(25) NOT NULL
,city      VARCHAR(25) NOT NULL
)

DELETE FROM SensorInfo

INSERT INTO SensorInfo (sensorId, brand, equipment, city)
VALUES
('sensor-001', 'ABB', 'Turbine Controller', 'Zurich'),
('sensor-002', 'Siemens', 'Voltage Regulator', 'Geneva'),
('sensor-003', 'GE', 'Transformer Monitor', 'Bern'),
('sensor-004', 'Hitachi', 'Circuit Breaker Sensor', 'Basel'),
('sensor-005', 'Schneider', 'Load Balancer', 'Lausanne'),
('sensor-006', 'ABB', 'Power Meter', 'Lausanne'),
('sensor-007', 'Siemens', 'Frequency Relay', 'St. Gallen'),
('sensor-008', 'GE', 'Cooling System Sensor', 'Lugano'),
('sensor-009', 'Hitachi', 'Switchgear Monitor', 'Thun'),
('sensor-010', 'Schneider', 'Energy Storage Sensor', 'Thun');
