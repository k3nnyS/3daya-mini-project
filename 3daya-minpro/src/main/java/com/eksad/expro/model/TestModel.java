package com.eksad.expro.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

@Table(name="t_test")
public class TestModel {

	@Id
	@Column(name="id", columnDefinition="serial")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "t_test_seq")
	@TableGenerator(name = "t_test_seq", table = "tbl_squence", 
	pkColumnName = "seq_id", valueColumnName = "seq_value", 
	initialValue = 0, allocationSize=1)
	private Integer id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="is_bootcamp_test")
	private Boolean isBootcampTest;
	
	@Column(name="notes")
	private String notes;
	
	@Column(name="created_by")
	private Integer createdBy;
	
	@Column(name="created_on")
	private Date createdOn;
	
	@Column(name="modified_by")
	private Integer modifiedBy;

	@Column(name="modified_on")
	private Date modifiedOn;
	
	@Column(name="deleted_by")
	private Integer deletedBy;
	
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

	public Boolean getIsBootcampTest() {
		return isBootcampTest;
	}

	public void setIsBootcampTest(Boolean isBootcampTest) {
		this.isBootcampTest = isBootcampTest;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Integer getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(Integer modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Date getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	public Integer getDeletedBy() {
		return deletedBy;
	}

	public void setDeletedBy(Integer deletedBy) {
		this.deletedBy = deletedBy;
	}

	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	
	
}
