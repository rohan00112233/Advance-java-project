<%@ page import="model.Food" %>

<%
    // Get the Food object sent by EditFoodServlet
    Food food = (Food) request.getAttribute("food");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Food</title>
</head>
<body>

    <h2>Edit Food</h2>

    <%
        // Check whether the food exists
        if (food != null) {
    %>

    <!--
        This form sends the updated data to EditFoodServlet.
        Method is POST because we are changing database data.
    -->
    <form action="edit-food" method="post">

        <!-- ID is hidden because the user does not need to edit it -->
        <input type="hidden" name="id" value="<%= food.getId() %>">

        <label>Food Name:</label>
        <input type="text"
               name="name"
               value="<%= food.getName() %>"
               required>
        <br><br>

        <label>Category:</label>
        <input type="text"
               name="category"
               value="<%= food.getCategory() %>"
               required>
        <br><br>

        <label>Price:</label>
        <input type="number"
               name="price"
               step="0.01"
               value="<%= food.getPrice() %>"
               required>
        <br><br>

        <label>Availability:</label>

        <select name="availability">

            <option value="Yes"
                <%= "Yes".equals(food.getAvailability()) ? "selected" : "" %>>
                Yes
            </option>

            <option value="No"
                <%= "No".equals(food.getAvailability()) ? "selected" : "" %>>
                No
            </option>

        </select>

        <br><br>

        <button type="submit">Update Food</button>

    </form>

    <br>

    <a href="admin-food">Back to Admin Food List</a>

    <%
        } else {
    %>

        <h3>Food not found.</h3>

        <a href="admin-food">Back to Admin Food List</a>

    <%
        }
    %>

</body>
</html>