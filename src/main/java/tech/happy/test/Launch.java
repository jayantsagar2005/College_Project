package tech.happy.test;

import java.util.ArrayList;

import tech.happy.dao.CommentDaoImp;
import tech.happy.model.CommentPojo;

public class Launch {

	public static void main(String[] args) {
		
		CommentDaoImp commentDaoImp = new CommentDaoImp();
		
		ArrayList<CommentPojo> list = commentDaoImp.readComment();
		 	
	}
 
}
