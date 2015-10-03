package com.restproject.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.restproject.dto.PlayersStatsAllYearsDTO;
import com.restproject.service.HomeStatsAllYearsServiceImp;

@Controller("playerHomeStatsResource")
public class PlayerHomeStatsResourceImpl implements PlayerHomeStatsResource {

@Autowired
HomeStatsAllYearsServiceImp homeStatsAllYearsService;

	@Override
	public PlayersStatsAllYearsDTO getAllPlayersHomeStats() {
		// TODO Auto-generated method stub
		return homeStatsAllYearsService.getAllYearsStats();
	}

	@Override
	public PlayersStatsAllYearsDTO getAllPLayersHomeStats(String playerName) {
		// TODO Auto-generated method stub
		return homeStatsAllYearsService.getAllYearsStatsByPlayer(playerName);
	}

}



