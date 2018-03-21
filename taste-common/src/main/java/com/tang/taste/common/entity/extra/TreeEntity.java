package com.tang.taste.common.entity.extra;

/**
 * 树结构实体父类，主要为了方便ztree的使用
 */
public class TreeEntity extends DataEntity {

	private boolean open;
	private boolean checked;

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
}
