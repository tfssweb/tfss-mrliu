package com.mrliu.support.dao;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

@Service
public class DataAccessManager implements ApplicationContextAware {
	private static ApplicationContext appContext;

	@Override
	public void setApplicationContext(ApplicationContext context)
			throws BeansException {
		appContext = context;
	}
	
	public static <T> T getMapper(Class<T> clazz) {
		return (T) appContext.getBean(clazz);
	}
}
