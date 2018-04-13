package edu.iot.butter.service;

import java.util.List;

import edu.iot.butter.model.Sensor;

public interface SensorService {
	List<Sensor> getList();
	Sensor get(long id);
	boolean insert(Sensor sensor);
	boolean update(Sensor sensor);
	boolean delete(long id);
}
