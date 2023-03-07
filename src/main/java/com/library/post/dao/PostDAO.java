package com.library.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.library.post.model.Post;

@Repository
public interface PostDAO {
	public List<Post> selectPostNoticeList(Integer num);

	/* public List<Post> selectPostNoticeList2(int min); */
	public int selectPostCnt();
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