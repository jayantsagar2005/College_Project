package tech.happy.dao;

import java.util.ArrayList;

import tech.happy.model.CommentPojo;

public interface CommentDao {
	public boolean addComment(CommentPojo data);
	public ArrayList<CommentPojo> readComment();
	public int pendingCount();
	public boolean updateStatus(int sNo);
	public ArrayList<CommentPojo> readCommentVerfied();
	public boolean deleteComment(int sNo);
}
