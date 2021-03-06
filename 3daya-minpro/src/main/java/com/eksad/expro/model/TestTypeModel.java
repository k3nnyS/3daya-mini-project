package com.eksad.expro.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;


@Entity
@Table(name="t_test_type")
public class TestTypeModel {
	@Id
	@Column(name="id", columnDefinition="serial")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "t_test_type_seq")
	@TableGenerator(name = "t_test_type_seq", table = "tbl_squence",
	pkColumnName = "seq_id", valueColumnName = "seq_value",
	initialValue = 0, allocationSize=1)
	private Integer id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="notes")
	private String notes;
	
	@Column(name="type_of_answer")
	private Integer typeOfAnswer;
	
	@Column(name="created_by")
	private Integer createdBy;
	
	@Column(name="created_on")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	private Timestamp createdOn;
	
	@Column(name="modified_by")
	private Integer modifiedBy;
	
	@Column(name="modified_on")
	private Timestamp modifiedOn;
	
	@Column(name="deleted_by")
	private Integer deletedBy;
	
	@Column(name="deleted_on")
	private Timestamp deletedOn;
	
	@Column(name="is_delete")
	private Boolean isDelete;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Integer getTypeOfAnswer() {
		return typeOfAnswer;
	}

	public void setTypeOfAnswer(Integer typeOfAnswer) {
		this.typeOfAnswer = typeOfAnswer;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public Integer getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(Integer modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Timestamp getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Timestamp modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	public Integer getDeletedBy() {
		return deletedBy;
	}

	public void setDeletedBy(Integer deletedBy) {
		this.deletedBy = deletedBy;
	}

	public Timestamp getDeletedOn() {
		return deletedOn;
	}

	public void setDeletedOn(Timestamp deletedOn) {
		this.deletedOn = deletedOn;
	}

	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	
	
	
	

}