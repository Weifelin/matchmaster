package edu.sbu.matchmaster;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
<<<<<<< 343f7d38729b16964bc4785ad5a3aa9db9a764f3
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
=======
>>>>>>> additions

@WebServlet(name = "StatsServlet", urlPatterns = {"/stats"})
public class StatsServlet extends HttpServlet{
    private static final String mostActiveProfilesQuery = "CREATE TEMPORARY TABLE Activity AS\n" +
            "(SELECT Pr.OwnerSSN AS Pers, COUNT(*) AS count\n" +
            "FROM Date D, Profile Pr\n" +
            "  WHERE D.Profile1=Pr.ProfileID\n" +
            "GROUP BY Pr.OwnerSSN)\n" +
            "UNION ALL\n" +
            "(SELECT Pr.OwnerSSN AS Pers, COUNT(*) AS count\n" +
            "FROM Date D, Profile Pr\n" +
            "  WHERE D.Profile2=Pr.ProfileID\n" +
            "GROUP BY Pr.OwnerSSN)\n" +
            "UNION ALL\n" +
            "(SELECT Pr.OwnerSSN AS Pers, COUNT(*) AS count\n" +
            "FROM Likes L, Profile Pr\n" +
            "  WHERE L.Liker=Pr.ProfileID\n" +
            "GROUP BY Pr.OwnerSSN)\n" +
            "UNION ALL\n" +
            "(SELECT Pr.OwnerSSN AS Pers, COUNT(*) AS count\n" +
            "FROM BlindDate R, Profile Pr\n" +
            "  WHERE R.ProfileA=Pr.ProfileID\n" +
            "GROUP BY Pr.OwnerSSN);\n" +
            "\n" +
            "SELECT A.Pers, SUM(A.count)\n" +
            "FROM Activity A\n" +
            "GROUP BY A.Pers\n" +
            "ORDER BY SUM(A.count) DESC\n" +
            "LIMIT 5;";
    private static final String highestRatedProfilesSQL = "CREATE TEMPORARY TABLE temp3 AS\n" +
            "(SELECT D.Profile1 AS Profile, AVG(USER1Rating) AS rating\n" +
            "FROM Date D\n" +
            "GROUP BY D.Profile1)\n" +
            "UNION ALL\n" +
            "(SELECT D.Profile2 AS Profile, AVG(USER2Rating) AS rating\n" +
            "FROM Date D\n" +
            "GROUP BY D.Profile2);\n" +
            "\n" +
            "SELECT V.Profile, AVG(V.rating)\n" +
            "FROM temp3 V\n" +
            "GROUP BY V.Profile\n" +
            "ORDER BY AVG(V.Rating) DESC\n" +
            "LIMIT 5;";
    private static final String mostPopularGeoDateLocationsSQL = "SELECT D.Location, COUNT(*)\n" +
            "FROM Date D\n" +
            "GROUP BY D.Location\n" +
            "ORDER BY COUNT(*) DESC\n" +
            "LIMIT 5;";
<<<<<<< 343f7d38729b16964bc4785ad5a3aa9db9a764f3

=======
>>>>>>> additions
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
<<<<<<< 343f7d38729b16964bc4785ad5a3aa9db9a764f3
        try{
            Connection conn = ConnectionUtils.getInstance().getConnection();
            PreparedStatement pstmtActive = conn.prepareStatement(mostActiveProfilesQuery);

            PreparedStatement pstmtRatedProfiles = conn.prepareStatement(highestRatedProfilesSQL);
            PreparedStatement pstmtRatedGeo = conn.prepareStatement(mostPopularGeoDateLocationsSQL);

            ResultSet rs = pstmtActive.executeQuery();
            List<String> active = new ArrayList<>();
            while(rs.next()){
                active.add(rs.getString("Pers"));
            }
            request.setAttribute("mostActiveProfiles", active);

        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        request.getServletContext().getRequestDispatcher("/WEB-INF/stats.jsp").forward(request, response);
=======
        Connection conn = ConnectionUtils.getInstance().getConnection();
        PreparedStatement pstmtActive = conn.prepareStatement(mostActiveProfilesQuery);
        PreparedStatement pstmtRatedProfiles = conn.prepareStatement(highestRatedProfilesSQL);
        PreparedStatement pstmtRatedGeo = conn.prepareStatement(mostPopularGeoDateLocationsSQL);

        ResultSet rs = pstmtActive.executeQuery();
        List<String> active = new ArrayList<String>();
        while(rs.next()){
            active.add(rs.getString("Pers"));
        }
        request.setAttribute("mostActiveProfiles", active);
>>>>>>> additions
    }
}
