package com.iiiproject._00_init.model;

import java.security.Principal;

public class MyPrincipal implements Principal{
	
	private String name;

    public MyPrincipal() {
	}

	public MyPrincipal(String name) {
		this.name = name;
	}

	public String getName() {
        return name;
    }

}
