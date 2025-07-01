package com.example.kapture.board.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.kapture.board.mapper.BoardMapper;
import com.example.kapture.board.model.Board;

@Service
public class BoardService {
	// get, select
	// add, insert
	// edit, update
	// remove, delete
	
	@Autowired
	BoardMapper boardMapper;

}

