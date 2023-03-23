package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import service.MovieService;

@RestController
public class searchController {

	@Autowired
	MovieService movieService;
	
    @GetMapping("/search.do")
    public List<Map<String, Object>> search() {
    	List movieList = movieService.movieList();
    
    	List<Map<String, Object>> members = new ArrayList<Map<String, Object>>();
        for (int i = 1; i <= 20; i++) {
            Map<String, Object> member = new HashMap<String, Object>();
            member.put("name", i + "영화");
            members.add(member);
        }
        return members;
    }

}
