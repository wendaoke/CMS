package com.very.util.db;


import org.apache.log4j.Logger;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import org.springframework.stereotype.Component;

/**
 * Created by rabbit on 14-5-25.
 */
@Component
public class MultipleDataSource extends AbstractRoutingDataSource {
	public static final Logger logger = Logger.getLogger(MultipleDataSource.class);
    private static final ThreadLocal<String> dataSourceKey = new InheritableThreadLocal<String>();

    public static void setDataSourceKey(String dataSource) {
        dataSourceKey.set(dataSource);
    }

    @Override
    protected Object determineCurrentLookupKey() {
    	String dataSource = dataSourceKey.get();
    	logger.info("dataSource:"+dataSource);
        return dataSource;
    }
}