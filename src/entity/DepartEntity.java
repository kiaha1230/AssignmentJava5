package entity;

import java.util.Collection;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "Departs")
@NamedStoredProcedureQueries ({
	@NamedStoredProcedureQuery(name="sp_deleteDepart",procedureName="sp_deleteDepart",parameters= {@StoredProcedureParameter(mode=ParameterMode.IN,name="Id",type=String.class)}) 
})
public class DepartEntity {
	@Id
	@Column(name = "Id")
	private String Id;
	@Column(name = "Name")
	private String Name;

	@OneToMany(mappedBy = "departEntity", fetch = FetchType.EAGER)
	private Collection<StaffEntity> staffEntities;
	
	 
	public DepartEntity() {
		
	}

	public DepartEntity(String id, String name, Collection<StaffEntity> staffEntities) {
		Id = id;
		Name = name;
		this.staffEntities = staffEntities;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public Collection<StaffEntity> getStaffEntities() {
		return staffEntities;
	}

	public void setStaffEntities(Collection<StaffEntity> staffEntities) {
		this.staffEntities = staffEntities;
	}

}
