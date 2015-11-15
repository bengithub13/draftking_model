package com.draftking.springbatch.model;

public class DraftKingCSVModel {
	private String position;
	private String Name;
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	private String salary;
	private String gameInfo;
	private Number avgPointsPerGame;
	private String teamAbbrev;
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getGameInfo() {
		return gameInfo;
	}
	public void setGameInfo(String gameInfo) {
		this.gameInfo = gameInfo;
	}
	public Number getAvgPointsPerGame() {
		return avgPointsPerGame;
	}
	public void setAvgPointsPerGame(Number avgPointsPerGame) {
		this.avgPointsPerGame = avgPointsPerGame;
	}
	public String getTeamAbbrev() {
		return teamAbbrev;
	}
	public void setTeamAbbrev(String teamAbbrev) {
		this.teamAbbrev = teamAbbrev;
	}
	
	
}
