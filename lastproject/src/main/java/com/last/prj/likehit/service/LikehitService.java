package com.last.prj.likehit.service;

public interface LikehitService {

    public int insertLike(LikehitVO hit);//추천비교 하기..
    public int deleteLike(LikehitVO hit);//추천취소 
    public int likeCheck(LikehitVO hit); //중복 체크 
}
