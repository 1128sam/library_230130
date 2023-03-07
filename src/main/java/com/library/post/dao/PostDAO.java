package com.library.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.library.post.model.Post;

@Repository
public interface PostDAO {
	public List<Post> selectPostNoticeList(Integer num);

	public List<Post> selectPostNoticeList2(@Param("min1") int min1, @Param("max") int max, @Param("type") int type);
	public int selectPostCnt(int type);
	public Post selectPostIdByPage(int page);
	public List<Post> selectPostRecommendList(Integer num);
	public Post selectPostById(int id);
	public int insertPost(
			@Param("title") String title,
			@Param("content") String content,
			@Param("userId") Integer userId,
			@Param("type") int type,
			@Param("filePath") String filePath);
	public void deletePost(int postId);
	public int updatePost(@Param("postId") int postId, @Param("title") String title, @Param("content") String content);
}