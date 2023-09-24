<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Order Page</h1>
    <form action="result.jsp" method="post">
        <% int numCustomers = Integer.parseInt(request.getParameter("numCustomers")); %>
        <input type="hidden" name="numCustomers" value="<%= numCustomers %>">

        <h2 class="mt-4">Individual Items</h2>
        <div id="individualItems">
            <div class="form-row mb-3">
                <div class="col-md-4">
                    <label for="individualName1">Name:</label>
                    <input type="text" class="form-control" name="individualName1" id="individualName1" required>
                </div>
                <div class="col-md-4">
                    <label for="individualPrice1">Price:</label>
                    <input type="number" class="form-control" name="individualPrice1" id="individualPrice1" required>
                </div>
                <div class="col-md-4">
                    <label for="individualQuantity1">Quantity:</label>
                    <input type="number" class="form-control" name="individualQuantity1" id="individualQuantity1" required>
                </div>
            </div>
            <button type="button" class="btn btn-primary" onclick="addItem('individual')">Add Item</button>
        </div>

        <h2 class="mt-4">Shared Items</h2>
        <div id="sharedItems">
            <div class="form-row mb-3">
                <div class="col-md-4">
                    <label for="sharedName1">Name:</label>
                    <input type="text" class="form-control" name="sharedName1" id="sharedName1" required>
                </div>
                <div class="col-md-4">
                    <label for="sharedPrice1">Price:</label>
                    <input type="number" class="form-control" name="sharedPrice1" id="sharedPrice1" required>
                </div>
                <div class="col-md-4">
                    <label for="sharedQuantity1">Quantity:</label>
                    <input type="number" class="form-control" name="sharedQuantity1" id="sharedQuantity1" required>
                </div>
            </div>
            <button type="button" class="btn btn-primary" onclick="addItem('shared')">Add Item</button>
        </div>

        <div class="mt-4">
            <input type="submit" class="btn btn-success" value="Calculate Bill">
        </div>
    </form>
</div>

<!-- Add Bootstrap JavaScript (jQuery and Popper.js are required) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    var individualItemCount = 1;
    var sharedItemCount = 1;

    function addItem(itemType) {
        if (itemType === "individual") {
            individualItemCount++;
            const newItemRow = document.createElement("div");
            newItemRow.innerHTML = `
                <div class="form-row mb-3">
                    <div class="col-md-4">
                        <label for="${itemType}Name${individualItemCount}">${itemType.charAt(0).toUpperCase() + itemType.slice(1)} Name:</label>
                        <input type="text" class="form-control" name="${itemType}Name${individualItemCount}" id="${itemType}Name${individualItemCount}" required>
                    </div>
                    <div class="col-md-4">
                        <label for="${itemType}Price${individualItemCount}">${itemType.charAt(0).toUpperCase() + itemType.slice(1)} Price:</label>
                        <input type="number" class="form-control" name="${itemType}Price${individualItemCount}" id="${itemType}Price${individualItemCount}" required>
                    </div>
                    <div class="col-md-4">
                        <label for="${itemType}Quantity${individualItemCount}">${itemType.charAt(0).toUpperCase() + itemType.slice(1)} Quantity:</label>
                        <input type="number" class="form-control" name="${itemType}Quantity${individualItemCount}" id="${itemType}Quantity${individualItemCount}" required>
                    </div>
                </div>
            `;
            document.getElementById(itemType + "Items").appendChild(newItemRow);
        } else if (itemType === "shared") {
            sharedItemCount++;
            const newItemRow = document.createElement("div");
            newItemRow.innerHTML = `
                <div class="form-row mb-3">
                    <div class="col-md-4">
                        <label for="${itemType}Name${sharedItemCount}">${itemType.charAt(0).toUpperCase() + itemType.slice(1)} Name:</label>
                        <input type="text" class="form-control" name="${itemType}Name${sharedItemCount}" id="${itemType}Name${sharedItemCount}" required>
                    </div>
                    <div class="col-md-4">
                        <label for="${itemType}Price${sharedItemCount}">${itemType.charAt(0).toUpperCase() + itemType.slice(1)} Price:</label>
                        <input type="number" class="form-control" name="${itemType}Price${sharedItemCount}" id="${itemType}Price${sharedItemCount}" required>
                    </div>
                    <div class="col-md-4">
                        <label for="${itemType}Quantity${sharedItemCount}">${itemType.charAt(0).toUpperCase() + itemType.slice(1)} Quantity:</label>
                        <input type="number" class="form-control" name="${itemType}Quantity${sharedItemCount}" id="${itemType}Quantity${sharedItemCount}" required>
                    </div>
                </div>
            `;
            document.getElementById(itemType + "Items").appendChild(newItemRow);
        }
    }
</script>
</body>
</html>
