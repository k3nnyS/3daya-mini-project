package com.eksad.expro.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="t_user")
@JsonIdentityInfo(generator=ObjectIdGenerators.PropertyGenerator.class, property="id")

public class UserModel {
	@Id
	@Column(name="id", columnDefinition ="serial")
	@GeneratedValue(strategy=GenerationType.TABLE, generator="user_seq")
	@TableGenerator(name="user_seq", table="tbl_squence", pkColumnName="seq_id", valueColumnName="seq_value", initialValue=0, allocationSize=1)
	
	private Integer id;
	
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;
	
	@Column(name="email")
	private String email;
	
	@Column(name="role_id")
	private Integer roleId;
	
	@Column(name="mobile_flag")
	private Boolean mobileFlag;
	
	@Column(name="mobile_token")
	private Integer mobileToken;
	
	@Column(name="create_by")
	private Integer createBy;
	
	@Column(name="create_on")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy hh:mm:ss")
	private Date createOn;
	
	@Column(name="modified_by")
	private Integer modifiedBy;
	
	@Column(name="modified_on")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy hh:mm:ss")
	private Date modifiedOn;
	
	@Column(name="deleted_by")
	private Integer deletedBy;
	
	@Column(name="delete_on")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy hh:mm:ss")
	private Date deleteOn;
	
	@Column(name="is_delete")
	private Boolean isDelete;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Boolean getMobileFlag() {
		return mobileFlag;
	}

	public void setMobileFlag(Boolean mobileFlag) {
		this.mobileFlag = mobileFlag;
	}

	public Integer getMobileToken() {
		return mobileToken;
	}

	public void setMobileToken(Integer mobileToken) {
		this.mobileToken = mobileToken;
	}

	public Integer getCreateBy() {
		return createBy;
	}

	public void setCreateBy(Integer createBy) {
		this.createBy = createBy;
	}

	public Date getCreateOn() {
		return createOn;
	}

	public void setCreateOn(String createOn) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date createOnNew=null;
		try {
			createOnNew=format.parse(createOn);
		}catch(Exception e) {
			this.createOn=null;
		}
		this.createOn = createOnNew;
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

	public void setModifiedOn(String modifiedOn) {
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		Date modifiedOnNew=null;
		try {
			modifiedOnNew=format.parse(modifiedOn);
		} catch (Exception e) {
			this.modifiedOn=null;
		}
		this.modifiedOn = modifiedOnNew;
	}

	public Integer getDeletedBy() {
		return deletedBy;
	}

	public void setDeletedBy(Integer deletedBy) {
		this.deletedBy = deletedBy;
	}

	public Date getDeleteOn() {
		return deleteOn;
	}

	public void setDeleteOn(String deleteOn) {
		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
		Date deleteOnNew=null;
		try {
			deleteOnNew=format.parse(deleteOn);
		} catch (Exception e) {
			this.deleteOn=null;
		}
		this.deleteOn = deleteOnNew;
	}

	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	
	
}
