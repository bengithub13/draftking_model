package com.draftking.dao;

import java.util.List;

import com.draftking.domain.HomeAddress;

//had to set GenericDAO<HomeAddress> because GenericDAO is set up as  public interface GenericDAO<T> 
//so we have to pass in the generic type.

public interface AddressDAO extends GenericDAO<HomeAddress> {
	public List<HomeAddress> findByZipCode(String zipcode);
	public List<HomeAddress> findByStreet(String street);
	public List<HomeAddress> findAll();
	
}
