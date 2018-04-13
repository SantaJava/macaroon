package edu.iot.butter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.iot.butter.model.Sensor;
import edu.iot.butter.service.SensorService;

// RestController를 쓴다 : method의 리턴값을 view의 이름으로 해석하지 말고 response바디로 해석해야 한다는 것을
// 알리는 것.
@RestController
@RequestMapping("api/sensor")
public class SensorApiController {
	@Autowired
	SensorService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public List<Sensor> getList() {
		return service.getList();
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Sensor get(@PathVariable long id) {
		return service.get(id);
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public boolean insert(@RequestBody Sensor sensor) {
		//RequestBody : JSON인코딩을 해석해준다.
		System.out.println(sensor);
		return service.insert(sensor);
	//	return true;
	}

	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public boolean update(@RequestBody Sensor sensor) {
		return service.update(sensor);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public boolean delete(@PathVariable long id) {
		return service.delete(id);
	}
}
