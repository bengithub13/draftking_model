package com.draftking.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="PLAYERS_TABLE", uniqueConstraints=@UniqueConstraint(name="PLAYER_CONSTR", columnNames={"player_name","team","position"}))
@SequenceGenerator(name="SEQ",sequenceName="PLAYERS_TABLE_SEQ")
public class PlayersTable extends AbstractDomain {
private String player_name;
private String team;
private String position;
public String getPlayer_name() {
	return player_name;
}
public void setPlayer_name(String player_name) {
	this.player_name = player_name;
}
public String getTeam() {
	return team;
}
public void setTeam(String team) {
	this.team = team;
}
public String getPosition() {
	return position;
}
public void setPosition(String position) {
	this.position = position;
}
	
}
