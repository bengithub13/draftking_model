package com.restproject.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.restproject.dao.HomeStatsAllYearsDAO;
import com.restproject.domain.HomeStatsAllYears;
import com.restproject.dto.PlayerStatsAllYearsDTO;
import com.restproject.dto.PlayersStatsAllYearsDTO;
import com.restproject.utility.Mapper;


@Service("HomeStatsAllYears")
public class HomeStatsAllYearsServiceImp implements HomeStatsAllYearsService {
@Resource(name="homeStatsAllYearsDAO")
HomeStatsAllYearsDAO homeStatsAllYearsDAO;
@Autowired
Mapper<HomeStatsAllYears, PlayerStatsAllYearsDTO> homeStatsAllYearsMapper;

	@Override
	
	public PlayersStatsAllYearsDTO getAllYearsStats() {
		List<HomeStatsAllYears> playersList= homeStatsAllYearsDAO.findAllPlayers();
		return new PlayersStatsAllYearsDTO(setAllPlayersDTO(playersList));
	}


	@Override
	public PlayersStatsAllYearsDTO getAllYearsStatsByPlayer(String player) {
		List<HomeStatsAllYears> playersList= homeStatsAllYearsDAO.findByPlayer(player);
		return new PlayersStatsAllYearsDTO(setAllPlayersDTO(playersList));
	}

	private List<PlayerStatsAllYearsDTO> setAllPlayersDTO(List<HomeStatsAllYears> playersList) {
		// TODO Auto-generated method stub
		List<PlayerStatsAllYearsDTO> allPlayersDTO = new ArrayList<PlayerStatsAllYearsDTO>();
		//map domain to each DTO
		for (HomeStatsAllYears hSay : playersList){
			PlayerStatsAllYearsDTO playerDTO=new PlayerStatsAllYearsDTO();
			homeStatsAllYearsMapper.map(hSay,playerDTO);
			allPlayersDTO.add(playerDTO);
		}
		return allPlayersDTO;
	}
}
