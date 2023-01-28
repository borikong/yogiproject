package net.dog.db;

import java.util.ArrayList;

public class DogDiseaseBean {

	private ArrayList<String> dog_diseases=new ArrayList<String>();
	
	public ArrayList<String> getDog_diseases() {
		return dog_diseases;
	}
	
	

	public void setDog_disease(String dog_disease) {
		this.dog_diseases.add(dog_disease);
	}
	
	
	
	
}
