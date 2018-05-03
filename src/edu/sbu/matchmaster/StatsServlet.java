package edu.sbu.matchmaster;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StatsServlet", urlPatterns = {"/stats"})
public class StatsServlet extends HttpServlet{
    private static final String mostActiveProfilesQuerySetup = "CREATE TEMPORARY TABLE actives AS\n" +
            "(SELECT D.Profile1 AS Profile, COUNT(*) AS count\n" +
            "FROM Date D\n" +
            "GROUP BY D.Profile1)\n" +
            "UNION ALL\n" +
            "(SELECT D.Profile2 AS Profile, COUNT(*) AS count\n" +
            "FROM Date D\n" +
            "GROUP BY D.Profile2)\n" +
            "UNION ALL\n" +
            "(SELECT L.Liker AS Profile, COUNT(*) AS count\n" +
            "FROM Likes L\n" +
            "GROUP BY L.Liker)\n" +
            "UNION ALL\n" +
            "(SELECT R.ProfileA AS Profile, COUNT(*) AS count\n" +
            "FROM BlindDate R\n" +
            "GROUP BY R.ProfileA);\n";
    private static final String mostActiveProfilesQuery = "SELECT A.Profile, SUM(A.count)\n" +
            "FROM actives A\n" +
            "GROUP BY A.Profile\n" +
            "ORDER BY SUM(A.count) DESC\n" +
            "LIMIT 5;";
    private static final String highestRatedProfilesSetup = "CREATE TEMPORARY TABLE temp3 AS\n" +
            "(SELECT D.Profile1 AS Profile, AVG(USER1Rating) AS rating\n" +
            "FROM Date D\n" +
            "GROUP BY D.Profile1)\n" +
            "UNION ALL\n" +
            "(SELECT D.Profile2 AS Profile, AVG(USER2Rating) AS rating\n" +
            "FROM Date D\n" +
            "GROUP BY D.Profile2);\n";
    private static final String highestRatedProfilesQuery = "SELECT V.Profile, AVG(V.rating) as rating\n" +
            "FROM temp3 V\n" +
            "GROUP BY V.Profile\n" +
            "ORDER BY AVG(V.Rating) DESC\n" +
            "LIMIT 5;";
    private static final String mostPopularGeoDateLocationsSQL = "SELECT D.Location, COUNT(*)\n" +
            "FROM Date D\n" +
            "GROUP BY D.Location\n" +
            "ORDER BY COUNT(*) DESC\n" +
            "LIMIT 5;";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try{
            Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmtActive = conn.prepareStatement(mostActiveProfilesQuerySetup);
            pstmtActive.execute();
            pstmtActive = conn.prepareStatement(mostActiveProfilesQuery);
            pstmtActive.executeQuery();
            ResultSet rs = pstmtActive.getResultSet();
            List<String> mostActiveProfiles = new ArrayList<>();
//            StringBuilder strDbg = new StringBuilder("Starting loop: ");
            while(rs.next()){
//                strDbg.append(rs.getString("Profile")+"; ");
                mostActiveProfiles.add(rs.getString("Profile"));
            }
            request.setAttribute("mostActiveProfiles", mostActiveProfiles);
            //request.setAttribute("strDbg", strDbg.toString());
            rs.close();
            pstmtActive.close();

            PreparedStatement pstmtRatedProfiles = conn.prepareStatement(highestRatedProfilesSetup);
            pstmtRatedProfiles.execute();
            pstmtRatedProfiles = conn.prepareStatement(highestRatedProfilesQuery);
            rs = pstmtRatedProfiles.executeQuery();
            List<String> highestRatedProfiles = new ArrayList<>();
            while(rs.next()){
                highestRatedProfiles.add(rs.getString("Profile") + ":\t" + rs.getInt("rating"));
            }
            request.setAttribute("highestRatedProfiles", highestRatedProfiles);
            rs.close();
            pstmtRatedProfiles.close();

            PreparedStatement pstmtRatedGeo = conn.prepareStatement(mostPopularGeoDateLocationsSQL);
            rs = pstmtRatedGeo.executeQuery();
            List<String> mostPopularGeo = new ArrayList<>();
            while(rs.next()){
                mostPopularGeo.add(rs.getString(1));
            }
            request.setAttribute("mostPopularGeo", mostPopularGeo);
            rs.close();
            pstmtRatedGeo.close();
            conn.close();
        }catch(Exception e){
            request.setAttribute("strDbg", e.getMessage());
        }
        request.getServletContext().getRequestDispatcher("/WEB-INF/stats.jsp").forward(request, response);
    }
}
