package com.restproject.dao;

import java.util.List;

import com.restproject.domain.HomeStatsAllYears;



	public interface HomeStatsAllYearsDAO extends GenericDAO<HomeStatsAllYears> {
		public List<HomeStatsAllYears> findByPlayer(String player);
		public List<HomeStatsAllYears> findAllPlayers();
		
	}