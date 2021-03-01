package com.kgitbank.spring.global.util;

import static org.junit.Assert.*;

import java.io.File;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUtilsTest {

	@Test
	public void currPathtoUnderbarPathTest() {
		String currPath = "2021/03/01/54da1c7e-de2f-418d-9ad8-695372a4c8cc_dog.jpg";
		String expected = "2021_03_01_54da1c7e-de2f-418d-9ad8-695372a4c8cc_dog.jpg";
		
		String underbarPath = FileUtils.currPathtoUnderbarPath(currPath);
		log.info(underbarPath);
		assertEquals(expected, underbarPath);
	}
	
	@Test
	public void underbarPathTocurrPathTest() {
		String underbarPath = "2021_03_01_54da1c7e-de2f-418d-9ad8-695372a4c8cc_dog.jpg";
		String expected = "2021" + File.separator + "03" + File.separator + "01" + File.separator + "54da1c7e-de2f-418d-9ad8-695372a4c8cc_dog.jpg";
		
		String currPath = FileUtils.underbarPathTocurrPath(underbarPath);
		log.info(currPath);
		assertEquals(expected, currPath);
	}
}
