package com.very.util.db;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
@Component
@Aspect
public class MultipleDataSourceAspectAdvice {
	public static final Logger logger = Logger.getLogger(MultipleDataSourceAspectAdvice.class);

	@Around("execution(* com.shishuo.cms.dao.*.*(..)) or execution(* com.very.*.*.*.*(..)) ")
    public Object  doAround(ProceedingJoinPoint jp) throws Throwable {
	
    	String className = jp.getSignature().getDeclaringTypeName();
    	logger.info("className:"+className);
        if (className.contains("com.shishuo.cms")) {
            MultipleDataSource.setDataSourceKey("shishuocmsDataSource");
        } else if (className.contains("com.very.card")){
            MultipleDataSource.setDataSourceKey("cardDataSource");
        }
        return  jp.proceed();
    }
}

