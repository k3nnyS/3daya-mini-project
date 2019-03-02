package com.eksad.expro.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "t_menu")
@JsonIdentityInfo(generator=ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class MenuModel {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "t_menu_seq")
	@TableGenerator(name = "t_menu_seq", table = "tbl_squence", pkColumnName = "seq_id",
	valueColumnName = "seq_value", initialValue = 0, allocationSize = 1)
	private Integer id;
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "image_url")
	private String imageUrl;
	
	@Column(name = "menu_order")
	private Integer menuOrder;
	
	@Column(name = "menu_parent")
	private Integer menuParent;
	
	@Column(name = "menu_url")
	private String menuUrl;
	
	@Column(name = "created_by")
	private Integer createdBy;
	
	@Column(name = "created_on")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	private Date createdOn;
	
	@Column(name = "modified_by")
	private Integer modifiedBy;
	
	@Column(name = "modified_on")
	@JsonFormat(shape =JsonFormat.Shape.STRING, pattern ="dd-MM-yyyy hh:mm:ss")
	private Date modifiedOn;
	
	@Column(name = "deleted_by")
	private Integer deletedBy;
	
	@Column(name = "deleted_on")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	private Date deletedOn;
	
	@Column(name = "is_delete")
	private Boolean isDelete;
	
	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name = "menu_parent",  updatable = false, insertable = false)
	private MenuModel parents;
	
	@JsonIgnore
	@OneToMany(mappedBy = "parents")
	private Set<MenuModel> child = new HashSet<MenuModel>();
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public Integer getMenuOrder() {
		return menuOrder;
	}
	public void setMenuOrder(Integer menuOrder) {
		this.menuOrder = menuOrder;
	}
	public Integer getMenuParent() {
		return menuParent;
	}
	public void setMenuParent(Integer menuParent) {
		this.menuParent = menuParent;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
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
	public Date getDeletedOn() {
		return deletedOn;
	}
	public void setDeletedOn(Date deletedOn) {
		this.deletedOn = deletedOn;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	public MenuModel getParents() {
		return parents;
	}
	public void setParents(MenuModel parents) {
		this.parents = parents;
	}
	public Set<MenuModel> getChild() {
		return child;
	}
	public void setChild(Set<MenuModel> child) {
		this.child = child;
	}
}
