package com.restproject.service;

import com.restproject.dto.PlayersStatsAllYearsDTO;



public interface HomeStatsAllYearsService {
public PlayersStatsAllYearsDTO getAllYearsStats( );
public PlayersStatsAllYearsDTO getAllYearsStatsByPlayer(String player);
}