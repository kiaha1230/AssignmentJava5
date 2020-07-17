package entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Staffs")
public class StaffEntity {

	public StaffEntity() {

	}

	@Id
	@Column(name = "Id")
	private String Id;
	@Column(name = "Name")
	private String Name;
	@Column(name = "Gender")
	private boolean Gender;

	@Column(name = "Birthday")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date Birthday;
	@Column(name = "Photo")
	private String Photo;
	@Column(name = "Email")
	private String Email;
	@Column(name = "Phone")
	private String Phone;
	@Column(name = "Salary")
	private float Salary;
	@Column(name = "Notes")
	private String Notes;
	@ManyToOne
	@JoinColumn(name = "DepartId")
	private DepartEntity departEntity;

	@OneToMany(mappedBy = "staffEntity", fetch = FetchType.EAGER)
	private Collection<RecordEntity> recordEntities;

	public StaffEntity(String id, String name, boolean gender, Date birthday, String photo, String email, String phone,
			float salary, String notes, DepartEntity departEntity, Collection<RecordEntity> recordEntities) {
		Id = id;
		Name = name;
		Gender = gender;
		Birthday = birthday;
		Photo = photo;
		Email = email;
		Phone = phone;
		Salary = salary;
		Notes = notes;
		this.departEntity = departEntity;
		this.recordEntities = recordEntities;
	}

	public StaffEntity(String id, String name, boolean gender, Date birthday, String photo, String email, String phone,
			float salary, String notes, DepartEntity departEntity) {
		Id = id;
		Name = name;
		Gender = gender;
		Birthday = birthday;
		Photo = photo;
		Email = email;
		Phone = phone;
		Salary = salary;
		Notes = notes;
		this.departEntity = departEntity;
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

	public boolean isGender() {
		return Gender;
	}

	public void setGender(boolean gender) {
		Gender = gender;
	}

	public Date getBirthday() {
		return Birthday;
	}

	public void setBirthday(Date birthday) {
		Birthday = birthday;
	}

	public String getPhoto() {
		return Photo;
	}

	public void setPhoto(String photo) {
		Photo = photo;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public float getSalary() {
		return Salary;
	}

	public void setSalary(float salary) {
		Salary = salary;
	}

	public String getNotes() {
		return Notes;
	}

	public void setNotes(String notes) {
		Notes = notes;
	}

	public DepartEntity getDepartEntity() {
		return departEntity;
	}

	public void setDepartEntity(DepartEntity departEntity) {
		this.departEntity = departEntity;
	}

	public Collection<RecordEntity> getRecordEntities() {
		return recordEntities;
	}

	public void setRecordEntities(Collection<RecordEntity> recordEntities) {
		this.recordEntities = recordEntities;
	}

	public String getGender() {
		String gen = "";
		if (Gender) {
			gen = "Nam";
		} else {
			gen = "Nữ";
		}
		return gen;
	}

}