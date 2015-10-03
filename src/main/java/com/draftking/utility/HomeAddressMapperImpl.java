package com.draftking.utility;

import org.springframework.stereotype.Component;

import com.draftking.domain.HomeAddress;
import com.draftking.dto.HomeAddressDTO;

@Component
public class HomeAddressMapperImpl implements Mapper<HomeAddress,HomeAddressDTO>{



	
	public HomeAddressDTO map(HomeAddress source, HomeAddressDTO target) {
		// TODO Auto-generated method stub
	
		target.setStreet(source.getStreet());
		target.setZipCode(source.getZipCode());
	return target;
	}

}
