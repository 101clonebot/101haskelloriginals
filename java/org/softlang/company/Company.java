package org.softlang.company;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

public class Company implements Serializable {

	private static final long serialVersionUID = -200889592677165250L;
	private String name;
	private List<Department> depts = new LinkedList<Department>();

	public Company() { }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Department> getDepts() {
		return depts;
	}
}
