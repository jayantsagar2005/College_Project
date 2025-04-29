package tech.happy.service;

import tech.happy.model.CommentPojo;

public interface CommentService {
	public String validData(CommentPojo data);
	public boolean addComment(CommentPojo data,String location); 
//	public boolean deleteComment(String sNo);
//	public boolean updateComment(TeamPojo data);
}
