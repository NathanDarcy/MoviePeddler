package edu.umsl.cs5012.groupproject.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class EntityBaseClass {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(id!=null && obj!=null && obj instanceof EntityBaseClass) {
			EntityBaseClass beo = (EntityBaseClass) obj;
			if(beo.getId()!=null) {
				return id.equals(beo.getId());
			}
		}
		return false;
	}

	@Override
	public int hashCode() {
		if(id!=null) {
			return id.hashCode();
		}else {
			return super.hashCode();	
		}
		
	}	
	
}
