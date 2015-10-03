package com.restproject.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

@Entity
@NamedQueries({
	@NamedQuery(name="com.restproject.domain.HomeStatsAllYears.findByPlayer",query="from HomeStatsAllYears a where a.player=?"),	
	@NamedQuery(name="com.restproject.domain.HomeStatsAllYears.findAllPlayers",query="from HomeStatsAllYears a")})


@Table(name = "HOME_STATS_ALL_YEARS_VIEW_2")
public class HomeStatsAllYears extends AbstractDomain {

	private static final long serialVersionUID = 2l;
	@Column(name = "PLAYER")
	private String player;
	@Column(name = "HOME_AVG")
	private Float homeAvg;
	@Column(name = "AWAY_AVG")
	private Float awayAvg;
	@Column(name = "Home_Games")
	private Integer homeGames;
	@Column(name = "Away_Games")
	private Integer awayGames;

	public String getPlayer() {
		return this.player;
	}

	public void setPlayer(String player) {
		this.player=player;
	}

	public Float getHomeAvg() {
		return this.homeAvg;
	}
	public void setHomeAvg(Float homeAvg) {
		this.homeAvg=homeAvg;
	}

	public Float getAwayAvg() {
		return this.awayAvg;
	}
	public void setAwayAvg(Float awayAvg) {
		this.awayAvg=awayAvg;
	}


	public Integer getHomeGames() {
		return this.homeGames;
	}

	public Integer getAwayGames() {
		return this.awayGames;
	}

}
