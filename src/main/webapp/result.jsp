<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
    <title>Bill Calculation Results</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1>Bill Calculation Results</h1>
    <%
        int numCustomers = Integer.parseInt(request.getParameter("numCustomers"));
        double totalIndividualPrice = 0.0;
        double totalSharedPrice = 0.0;

        int sharedItemCount = 1;

        while (true) {
            String sharedName = request.getParameter("sharedName" + sharedItemCount);
            String sharedPriceStr = request.getParameter("sharedPrice" + sharedItemCount);
            String sharedQuantityStr = request.getParameter("sharedQuantity" + sharedItemCount);

            if (sharedName == null || sharedPriceStr == null || sharedQuantityStr == null) {
                break;
            }

            double sharedPrice = Double.parseDouble(sharedPriceStr);
            int sharedQuantity = Integer.parseInt(sharedQuantityStr);

            totalSharedPrice += sharedPrice;
            sharedItemCount++;
        }

        Map<String, Double> map = new HashMap<>();
        int i = 1;

        while (true) {
            String individualName = request.getParameter("individualName" + i);
            String individualPriceStr = request.getParameter("individualPrice" + i);
            String individualQuantityStr = request.getParameter("individualQuantity" + i);

            if (individualName == null || individualPriceStr == null || individualQuantityStr == null) {
                break;
            }

            double individualPrice = Double.parseDouble(individualPriceStr);
            int individualQuantity = Integer.parseInt(individualQuantityStr);
            double price = individualPrice / individualQuantity;
            map.put(individualName, price);

            totalIndividualPrice += individualPrice;
            i++;
        }
    %>

    <div class="alert alert-success">
        <ul>
            <%
                for (Map.Entry<String, Double> entry : map.entrySet()) {
                    String itemName = entry.getKey();
                    Double itemPrice = entry.getValue();
                    double shPrice =  (totalSharedPrice / numCustomers);
            %>
            <li>Item: <%= itemName %> -> Price: <%= itemPrice %> + <%=shPrice%> </li>
            <%
                }
            %>
        </ul>

    </div>

    <div class="alert alert-info">
        Total Individual Items Price: $<%= totalIndividualPrice %>
    </div>

    <div class="alert alert-warning">
        Total Shared Items Price ic: $<%= totalSharedPrice %>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
