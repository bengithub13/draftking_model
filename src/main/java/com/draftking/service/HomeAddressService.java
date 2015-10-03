package com.draftking.service;



import com.draftking.dto.AddressesDTO;


public interface HomeAddressService {
public AddressesDTO getAllAddressListByZipCode(String zipCode);
public AddressesDTO getAllAddressList();
public AddressesDTO getAllAddressByStreet(String street);
}
