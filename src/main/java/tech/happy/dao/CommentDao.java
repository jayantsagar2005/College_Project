package tech.happy.dao;

import java.util.ArrayList;

import tech.happy.model.CommentPojo;

public interface CommentDao {
	public boolean addComment(CommentPojo data, String location);
	public ArrayList<CommentPojo> readComment(String location);
	public int pendingCount(String location);
	public boolean updateStatus(int sNo);
	public ArrayList<CommentPojo> readCommentVerfied(String location);
	public boolean deleteComment(int sNo);
}
