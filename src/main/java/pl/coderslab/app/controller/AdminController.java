package pl.coderslab.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.coderslab.app.dao.MovieDao;
import pl.coderslab.app.model.Movie;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class AdminController {

    private Path path;

    @Autowired
    private MovieDao movieDao;

    @RequestMapping("/admin")
    public String administration() {
        return "admin";
    }

    @RequestMapping("/admin/movieInventory")
    public String movieInventory(Model model) {
        List<Movie> movies = movieDao.getAllMovies();
        model.addAttribute("movies", movies);

        return "movieInventory";
    }

    @GetMapping("/admin/movieInventory/addMovie")
    public String addMovie(Model model) {
        Movie movie = new Movie();
        model.addAttribute("movie", movie);

        return "addMovie";
    }

    @GetMapping("/admin/movieInventory/updateMovie/{movieId}")
    public String updateMovie(@PathVariable int movieId, Model model) {
        Movie movie = movieDao.getMovieById(movieId);
        model.addAttribute(movie);

        return "updateMovie";
    }

    @PostMapping("/admin/movieInventory/updateMovie/{movieId}")
    public String updateMoviePost(@PathVariable int movieId, @ModelAttribute("movie") Movie movie, HttpServletRequest request) {

        String rootDirectory = request.getSession().getServletContext().getRealPath("WEB-INF/resources/images/");
        path = Paths.get(rootDirectory + movieId + ".jpg");

        if (Files.exists(path)) {
            try {
                Files.delete(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        MultipartFile movieImage = movie.getMovieImage();

        if (movieImage != null && !movieImage.isEmpty()) {
            try {
                movieImage.transferTo(new File(path.toString()));
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Image update failed");
            }
        }

        movieDao.updateMovie(movie);

        return "redirect:/admin/movieInventory";
    }


    @PostMapping("/admin/movieInventory/addMovie")
    public String addMoviePost(@ModelAttribute("movie") Movie movie, HttpServletRequest request) {
        movieDao.addMovie(movie);

        MultipartFile movieImage = movie.getMovieImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/images/");
        path = Paths.get(rootDirectory + movie.getMovieId()+".jpg");

        if (movieImage != null && !movieImage.isEmpty()) {
            try {
                movieImage.transferTo(new File(path.toString()));
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Image saving failed");
            }
        }

        return "redirect:/admin/movieInventory";
    }

    @RequestMapping("/admin/movieInventory/deleteMovie/{movieId}")
    public String deleteMovie(@PathVariable int movieId, Model model, HttpServletRequest request) throws IOException {
        movieDao.deleteMovie(movieId);

        String rootDirectory = request.getSession().getServletContext().getRealPath("WEB-INF/resources/images/");
        path = Paths.get(rootDirectory + movieId + ".jpg");

        if (Files.exists(path)) {
            try {
                Files.delete(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


        return "redirect:/admin/movieInventory";
    }
}