package com.draftking.utility;

import org.springframework.stereotype.Component;




import com.draftking.domain.Owner;
import com.draftking.dto.OwnerDTO;

@Component
public class OwnersMapperImpl implements Mapper<Owner,OwnerDTO>{



	
	
	public OwnerDTO map(Owner source, OwnerDTO target) {
		// TODO Auto-generated method stub
		target.setFirstName(source.getFirstName());
		target.setLastName(source.getLastName());
		return target;
	}

}