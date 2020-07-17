package entity;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "Records")
public class RecordEntity {
	@Id
	@GeneratedValue
	@Column(name = "Id")
	int Id;
	@Column(name = "Type")
	int Type;
	@Column(name = "Reason")
	String Reason;
	@Column(name = "Date")
	String Date;

	@ManyToOne
	@JoinColumn(name = "StaffId")
	private StaffEntity staffEntity;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public int getType() {
		return Type;
	}

	public void setType(int type) {
		Type = type;
	}

	public String getReason() {
		return Reason;
	}

	public void setReason(String reason) {
		Reason = reason;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public StaffEntity getStaffEntity() {
		return staffEntity;
	}

	public void setStaffEntity(StaffEntity staffEntity) {
		this.staffEntity = staffEntity;
	}

	public RecordEntity() {

	}

	public RecordEntity(int id, int type, String reason, String date, StaffEntity staffEntity) {
		Id = id;
		Type = type;
		Reason = reason;
		Date = date;
		this.staffEntity = staffEntity;
	}

	public String getStringType() {
		String type = "";
		if (Type == 1) {
			type = "Khen thưởng";
		} else {
			type = "Kỉ luật";
		}

		return type;
	}
}
