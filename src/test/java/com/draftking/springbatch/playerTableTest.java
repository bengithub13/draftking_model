package com.draftking.springbatch;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.batch.core.BatchStatus;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@ContextConfiguration(locations = { "classpath:/META-INF/applicationContext.xml" })
public class playerTableTest extends AbstractTransactionalJUnit4SpringContextTests{
	
	@Autowired
	private JobLauncher jobLauncher;
	@Autowired
	private Job job;

	@Test
	public void launchJob() throws Exception {

		
		
			JobExecution jobExecution =jobLauncher.run(job,new JobParameters());
		
			
		 
		// JobExecution jobExecution = jobLauncherTestUtils.launchStep("step1");

		assertEquals(BatchStatus.COMPLETED, jobExecution.getStatus());

	}

	
}
