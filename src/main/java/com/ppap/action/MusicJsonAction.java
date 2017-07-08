/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ppap.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.ppap.util.JsonReader;

/**
 * Servlet implementation class SimpleJsonWriter
 */
@WebServlet("/JsonDoubanAction")
public class MusicJsonAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MusicJsonAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		JSONObject json = JsonReader.readJsonFromUrl("https://api.douban.com/v2/music/:id");
		
		//放开限制避免 No 'Access-Control-Allow-Origin' header is present 错误
		response.addHeader("Access-Control-Allow-Origin", "*");
		
		response.setCharacterEncoding("Utf-8");
        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json.get("subjects"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}

