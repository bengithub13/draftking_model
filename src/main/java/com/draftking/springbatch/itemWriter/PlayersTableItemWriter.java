package com.draftking.springbatch.itemWriter;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.batch.item.ItemWriter;
import org.springframework.stereotype.Component;

import com.draftking.domain.PlayersTable;
import com.draftking.springbatch.model.DraftKingCSVModel;

@Component("playersTableItemWriter")
public class PlayersTableItemWriter implements ItemWriter<DraftKingCSVModel>{
//@Autowired

@PersistenceContext(unitName="restProjectPU")
private EntityManager em;
	
	public void write(List<? extends DraftKingCSVModel> draftKingCSVPLayers) throws Exception {
		// TODO Auto-generated method stub
		for (DraftKingCSVModel draftKingCSVPlayer:draftKingCSVPLayers){
			PlayersTable playersTable = new PlayersTable();
			mapPlayersTableDomain(playersTable,draftKingCSVPlayer);
			em.persist(playersTable);
		}
		
	}
	
	private void mapPlayersTableDomain(PlayersTable playersTable, DraftKingCSVModel draftKingCSVModel){
		playersTable.setPlayer_name(draftKingCSVModel.getName());
		playersTable.setPosition(draftKingCSVModel.getPosition());
		playersTable.setTeam(draftKingCSVModel.getTeamAbbrev());
	}
}
