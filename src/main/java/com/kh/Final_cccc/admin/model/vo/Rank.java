package com.kh.Final_cccc.admin.model.vo;

public class Rank {
	private String Name;
    private int count;
    private int Rank;
    public Rank() {}

    public Rank(String name, int count, int rank) {
        super();
        Name = name;
        this.count = count;

        Rank = rank;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getRank() {
        return Rank;
    }

    public void setRank(int rank) {
        Rank = rank;
    }

	@Override
	public String toString() {
		return "Rank [Name=" + Name + ", count=" + count + ", Rank=" + Rank + "]";
	}
    
    
}
