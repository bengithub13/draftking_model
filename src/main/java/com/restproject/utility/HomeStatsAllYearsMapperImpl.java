package com.restproject.utility;

import org.springframework.stereotype.Component;

import com.restproject.domain.HomeStatsAllYears;
import com.restproject.dto.PlayerStatsAllYearsDTO;

@Component
public class HomeStatsAllYearsMapperImpl implements Mapper<HomeStatsAllYears,PlayerStatsAllYearsDTO> {



		
		
		public PlayerStatsAllYearsDTO map(HomeStatsAllYears source, PlayerStatsAllYearsDTO target) {
			// TODO Auto-generated method stub
			target.setPlayerName(source.getPlayer());
			target.setHomeAvg(source.getHomeAvg());
			target.setAwayAvg(source.getAwayAvg());
			target.setHomeCount(source.getHomeGames());
			target.setAwayCount(source.getAwayGames());
		
			return target;
		}
}
